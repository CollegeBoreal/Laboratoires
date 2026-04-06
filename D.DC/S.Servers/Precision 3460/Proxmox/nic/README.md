
# 📝 Proxmox NIC Stability Fix – EEE Disable (nic0)

- [ ] ⚠️ [Intel NIC e1000e hardware unit hang](https://www.reddit.com/r/Proxmox/comments/1drs89s/intel_nic_e1000e_hardware_unit_hang/)

Run the command below in the Proxmox VE Shell to install Intel e1000e NIC Offloading Fix.

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/tools/pve/nic-offloading-fix.sh)"
```

---

```
    _   ____________   ____  __________                ___                ____  _            __    __
   / | / /  _/ ____/  / __ \/ __/ __/ /___  ____ _____/ (_)___  ____ _   / __ \(_)________ _/ /_  / /__  _____
  /  |/ // // /      / / / / /_/ /_/ / __ \/ __ `/ __  / / __ \/ __ `/  / / / / / ___/ __ `/ __ \/ / _ \/ ___/
 / /|  // // /___   / /_/ / __/ __/ / /_/ / /_/ / /_/ / / / / / /_/ /  / /_/ / (__  ) /_/ / /_/ / /  __/ /
/_/ |_/___/\____/   \____/_/ /_/ /_/\____/\__,_/\__,_/_/_/ /_/\__, /  /_____/_/____/\__,_/_.___/_/\___/_/
                                                             /____/
Enhanced version supporting both e1000e and e1000 drivers

  ℹ️   Searching for Intel e1000e and e1000 interfaces...
  ✔️   Found 1 Intel e1000e/e1000 interfaces
  ✔️   Selected interface: nic0 (e1000e)
  ℹ️   Creating systemd service for interface: nic0 (e1000e)...
  ✔️   Service for nic0 (e1000e) created and enabled!
  ℹ️     Service: disable-nic-offload-nic0.service...
  ℹ️     Status: Active...
  ℹ️     Start on boot: Enabled...
  ✔️   Intel e1000e/e1000 optimization complete for 1 interface(s)!

  ℹ️   Verification commands:...
  ethtool -k nic0 # Check offloading status
  systemctl status disable-nic-offload-nic0.service # Check service status
```

---




### Fixes TOC

- [ ] [1️⃣ Disable EEE](README.md#-permanent-fix-proxmox-configuration)
- [ ] [2️⃣ Disable power saving](README.md#-add-kernel-parameters-grub-method)


## 🎯 Objective

Fix intermittent network instability on Proxmox hosts (link drops, NIC hangs, VM bridge resets) by disabling **Energy Efficient Ethernet (EEE)** on the physical NIC.

---

# ⚠️ Problem observed

* Random NIC disconnects under load
* `NIC Link is Down` events
* `Hardware Unit Hang` (e1000e driver)
* Required physical cable unplug/replug to recover
* Issue reproducible on multiple Dell Precision 3460 systems

---

# 🧠 Root cause

EEE (Energy Efficient Ethernet):

* Causes power-state negotiation with switch
* Can trigger instability under load with certain NIC + switch combinations
* Interacts poorly with `e1000e` driver in virtualization environments

---

# 🛠️ Temporary fix (runtime)

Disable EEE immediately:

```bash
ethtool --set-eee nic0 eee off
```

---

# 🔍 Verification

```bash
ethtool --show-eee nic0
```

Expected result:

```text
EEE status: disabled
```

---

# 🧾 Permanent fix (Proxmox configuration)

Edit:

```bash
vi /etc/network/interfaces
```

Add to the **physical interface (`nic0`)**:

```bash
auto lo
iface lo inet loopback

iface nic0 inet manual
    post-up /usr/sbin/ethtool --set-eee nic0 eee off

auto vmbr0
iface vmbr0 inet static
    address 10.7.237.25/23
    gateway 10.7.237.1
    bridge-ports nic0
    bridge-stp off
    bridge-fd 0

source /etc/network/interfaces.d/*
```

---

# 🔄 Apply changes

Without reboot:

```bash
ifreload -a
```

or reboot:

```bash
reboot
```

---

# ✅ Expected outcome after fix

* EEE permanently disabled
* Stable NIC under high load
* No link flapping
* No hardware unit hang
* No need to physically reconnect cable

---

# 📌 Key lesson

> NIC-level hardware features (EEE, offloading, power states) must be configured on the **physical interface**, not the bridge.

---

# 🧪 Optional next hardening steps (if needed later)

* Disable offloading (TSO/GSO/GRO)
* Tune interrupt moderation for `e1000e`
* Switch to Intel server-grade NIC (i210/i225)

---

# 🔗 e1000e

```bash
dmesg -T | tail -200
```
```
                           buffer_info[next_to_clean]:
                             time_stamp           <106dcb785>
                             next_to_watch        <51>
                             jiffies              <1074da3c0>
                             next_to_watch.status <0>
                           MAC Status             <40080083>
                           PHY Status             <796d>
                           PHY 1000BASE-T Status  <3800>
                           PHY Extended Status    <3000>
                           PCI Status             <10>
[Sun Mar 29 00:18:16 2026] e1000e 0000:00:1f.6 nic0: Detected Hardware Unit Hang:
                             TDH                  <51>
                             TDT                  <7e>
                             next_to_use          <7e>
                             next_to_clean        <50>
                           buffer_info[next_to_clean]:
                             time_stamp           <106dcb785>
                             next_to_watch        <51>
                             jiffies              <1074dab80>
                             next_to_watch.status <0>
                           MAC Status             <40080083>
                           PHY Status             <796d>
                           PHY 1000BASE-T Status  <3800>
                           PHY Extended Status    <3000>
                           PCI Status             <10>
[Sun Mar 29 00:18:18 2026] e1000e 0000:00:1f.6 nic0: Detected Hardware Unit Hang:
                             TDH                  <51>
                             TDT                  <7e>
                             next_to_use          <7e>
                             next_to_clean        <50>
                           buffer_info[next_to_clean]:
                             time_stamp           <106dcb785>
                             next_to_watch        <51>
                             jiffies              <1074db380>
                             next_to_watch.status <0>
                           MAC Status             <40080083>
                           PHY Status             <796d>
                           PHY 1000BASE-T Status  <3800>
                           PHY Extended Status    <3000>
                           PCI Status             <10>
[Mon Mar 30 16:44:41 2026] e1000e 0000:00:1f.6 nic0: Detected Hardware Unit Hang: TDH <75> TDT <88> next_to_use <88> next_to_clean <74> buffer_info[next_to_clean]: time_stamp <10fd5ab1b> next_to_watch <75> jiffies <10fe2bcc0> next_to_watch.status <0> MAC Status <40080083> PHY Status <796d> PHY 1000BASE-T Status <8ff> PHY Extended Status <3000> PCI Status <10>
[Mon Mar 30 16:44:42 2026] e1000e 0000:00:1f.6 nic0: NIC Link is Down
[Mon Mar 30 16:44:42 2026] vmbr0: port 1(nic0) entered disabled state
[Mon Mar 30 16:44:50 2026] e1000e 0000:00:1f.6 nic0: NIC Link is Up 1000 Mbps Full Duplex, Flow Control: Rx/Tx
[Mon Mar 30 16:44:50 2026] vmbr0: port 1(nic0) entered blocking state
[Mon Mar 30 16:44:50 2026] vmbr0: port 1(nic0) entered forwarding state
[Mon Mar 30 16:58:45 2026] usb 1-4: USB disconnect, device number 6
[Mon Mar 30 16:58:45 2026] usb 1-5: USB disconnect, device number 7
[Mon Mar 30 16:59:00 2026] perf: interrupt took too long (4022 > 4010), lowering kernel.perf_event_max_sample_rate to 49000
[Mon Mar 30 17:04:04 2026] perf: interrupt took too long (5044 > 5027), lowering kernel.perf_event_max_sample_rate to 39000
[Mon Mar 30 17:09:58 2026] perf: interrupt took too long (6308 > 6305), lowering kernel.perf_event_max_sample_rate to 31000
[Mon Mar 30 18:40:48 2026] hrtimer: interrupt took 1544 ns
```




This log finally confirms the **real root cause very clearly**.

You are NOT dealing with Proxmox storage anymore — this is a **hardware + driver stability issue on the network side** of your **Proxmox VE host.**

---

# 🚨 THE CRITICAL ERROR

## 🔴 Repeated line:

```text id="net1"
e1000e ... NIC Link is Down
Detected Hardware Unit Hang
```

This is the key.

---

# 🧠 What it means (plain English)

Your Intel NIC (`e1000e` driver) is:

> 💥 freezing internally → kernel detects it → resets the NIC → link drops → comes back → repeats

This is called:

### ⚠️ “Hardware Unit Hang” (Intel e1000e failure state)

---

# 🔥 Why this is happening

You have a **perfect storm**:

## 1. ❌ e1000e driver instability

This driver is:

* older
* sensitive to virtualization load
* known to hang under heavy traffic bursts

---

## 2. ❌ IRQ / interrupt starvation

You also have:

```text id="irq1"
perf: interrupt took too long
```

👉 meaning:

* CPU cannot service network interrupts fast enough
* NIC watchdog triggers reset

---

## 3. ❌ High load stress (your original issue)

You previously described:

* VM bandwidth saturation
* IO spikes (likely ZFS / NVMe)
* Proxmox bridge (`vmbr0`) under load

---

## 4. ❌ Power management / PCIe behavior

Common trigger:

* C-states / ASPM
* energy-saving NIC behavior
* PCIe power gating

---

# 🧠 Why EVERYTHING drops (host + VM)

When this happens:

```text id="chain1"
e1000e freezes
→ kernel resets NIC
→ vmbr0 goes down
→ VM loses network
→ host appears “offline”
```

---

# 🚨 The most important conclusion

## ❌ This is NOT Proxmox

## ❌ This is NOT ZFS anymore

## ❌ This is NOT VM configuration

👉 This is:

> ⚠️ Intel e1000e driver + hardware NIC instability under load

---

# 🏆 Fix strategy (ranked properly)

---

# 🥇 FIX #1 (MOST IMPORTANT): disable power saving

Add kernel params:

```bash id="fix1"
intel_idle.max_cstate=1 processor.max_cstate=1 pcie_aspm=off
```

This alone fixes many “link down under load” issues.

---

# 🥇 FIX #2: stop using aggressive NIC power features

Create:

```bash id="fix2"
/etc/modprobe.d/e1000e.conf
```

Add:

```bash id="fix3"
options e1000e InterruptThrottleRate=0
options e1000e SmartPowerDownEnable=0
options e1000e RxIntDelay=0
options e1000e TxIntDelay=0
```

---

# 🥈 FIX #3: reduce IRQ starvation

Install:

```bash id="fix4"
apt install irqbalance
systemctl enable irqbalance
systemctl start irqbalance
```

---

# 🥈 FIX #4: VM network tuning

Inside VM:

* virtio NIC
* multiqueue = 4–8
* offload enabled

---

# 🥉 FIX #5 (REAL LONG-TERM FIX)

## 👉 Replace the NIC

Your current NIC is:

> Intel **e1000e (desktop-class, not server-class)**

This is the real root problem under virtualization load.

---

## Recommended replacements:

* Intel i210
* Intel i225-V (newer boards)
* PCIe Intel server NIC

---

# 🧠 Why this only happens under load

Because:

```text id="load1"
low traffic → OK
high VM traffic → interrupts spike
CPU delay → NIC watchdog triggers reset
```

So it *only fails when you stress it*.

---

# 🏁 Final diagnosis (clear)

You have:

## 🔴 Primary issue

👉 e1000e NIC hardware/driver hang under load

## 🟠 Secondary issue

👉 CPU interrupt latency (“perf interrupt took too long”)

## 🟡 Amplifier

👉 VM + storage + network saturation on one host

---

# 💬 What I recommend you do next

If you want stability (FPGA dev environment):

## 🥇 Best path:

1. apply kernel + e1000e fixes (above)
2. test again under load
3. if still happening → replace NIC

---

## 🧼 Ultimate stable setup (what I would do in your case)

* Proxmox VE tuned kernel
* LVM-thin or mirrored ZFS only for VMs
* Intel i210/i225 NIC
* IRQ balancing enabled
* no aggressive power saving


---

# 🧠 Add kernel parameters (GRUB method)

## ⚙️ 1. Edit GRUB config

```bash
vi /etc/default/grub
```

---

## 🔧 2. Find this line

```bash
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
```

(or it may contain other options already)

---

## ✏️ 3. Add your parameters inside the quotes

Change it to:

```bash
GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_idle.max_cstate=1 processor.max_cstate=1 pcie_aspm=off"
```

---

# 💾 4. Apply changes

Run:

```bash
update-grub
```

---

# 🔄 5. Reboot

```bash
reboot
```

---

# 🧪 6. Verify after reboot

Check if parameters are active:

```bash
cat /proc/cmdline
```

You should see:

```text
intel_idle.max_cstate=1 processor.max_cstate=1 pcie_aspm=off
```

---

# ⚠️ Important notes for your issue

These settings specifically help your case:

## 🔥 intel_idle.max_cstate=1

* prevents deep CPU sleep states
* reduces latency spikes
* stabilizes NIC interrupt handling

## 🔥 processor.max_cstate=1

* forces CPU to stay responsive

## 🔥 pcie_aspm=off

* disables PCIe power saving
* very important for your **e1000e NIC instability**

---

# 🧠 Why this matters for your setup

Your logs showed:

* NIC “Hardware Unit Hang”
* perf interrupt delays
* vmbr0 drops under load

👉 These kernel parameters reduce the **latency spikes that trigger NIC resets**

---

# 🚀 If you want next step

I can help you go further with:

### 🔧 NIC-specific fix (e1000e tuning file)

### ⚡ IRQ balancing optimization

### 🧠 full “stable Proxmox under load” profile for FPGA workloads

Just tell me 👍
