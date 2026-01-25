# 🛠️ Upgrade Preparation & Full Update Script

Run all commands **as root**.

---

## 1️⃣ Backup

Make sure **all VMs, containers, and configs are backed up**.

```bash
# Example: backup all VMs
vzdump --all --storage local --mode snapshot
```

Never skip this step — in-place upgrades can fail.

---

## 2️⃣ Switch Debian repos to archive

```bash
# Replace /etc/apt/sources.list
cat > /etc/apt/sources.list <<'EOF'
deb http://archive.debian.org/debian buster main contrib
deb http://archive.debian.org/debian buster-updates main contrib
deb http://archive.debian.org/debian-security buster/updates main contrib
EOF
```

---

## 3️⃣ Switch Proxmox 6 repo to archive (no-subscription)

```bash
cat > /etc/apt/sources.list.d/pve-no-subscription.list <<'EOF'
deb http://archive.proxmox.com/debian/pve buster pve-no-subscription
EOF

# Disable enterprise repo if exists
sed -i 's/^deb/#deb/' /etc/apt/sources.list.d/pve-enterprise.list
```

---

## 4️⃣ Disable expired metadata check (required for archive repos)

```bash
cat > /etc/apt/apt.conf.d/99disable-check-valid-until <<'EOF'
Acquire::Check-Valid-Until "0";
EOF
```

---

## 5️⃣ Update & upgrade system

```bash
apt update
```
<details>

```lua
Get:1 http://archive.debian.org/debian buster InRelease [122 kB]
Get:2 http://archive.debian.org/debian buster-updates InRelease [56.6 kB]
Get:3 http://archive.debian.org/debian-security buster/updates InRelease [34.8 kB]
Get:4 http://archive.proxmox.com/debian/pve buster InRelease [3,480 B]
Get:5 http://archive.debian.org/debian buster/main amd64 Packages [7,909 kB]
Get:6 http://archive.debian.org/debian buster/main Translation-en [5,969 kB]
Get:7 http://archive.proxmox.com/debian/pve buster/pve-no-subscription amd64 Packages [467 kB]
Get:8 http://archive.debian.org/debian buster/contrib amd64 Packages [50.1 kB]                    
Get:9 http://archive.debian.org/debian buster/contrib Translation-en [44.2 kB]              
Get:10 http://archive.debian.org/debian buster-updates/main amd64 Packages [8,788 B]             
Get:11 http://archive.debian.org/debian buster-updates/main Translation-en [6,915 B]         
Get:12 http://archive.debian.org/debian-security buster/updates/main amd64 Packages [610 kB]     
Get:13 http://archive.debian.org/debian-security buster/updates/main Translation-en [330 kB]
Get:14 http://archive.debian.org/debian-security buster/updates/contrib amd64 Packages [3,460 B]
Get:15 http://archive.debian.org/debian-security buster/updates/contrib Translation-en [1,488 B]
Fetched 15.6 MB in 4s (3,991 kB/s)                                                                
Reading package lists... Done
Building dependency tree       
Reading state information... Done
231 packages can be upgraded. Run 'apt list --upgradable' to see them.
```

</details>


apt dist-upgrade -y
reboot
```

> After reboot, your system should have **latest Proxmox 6.4 packages** including `pve6to7`.

---

## 6️⃣ Verify `pve6to7`

```bash
pveversion
which pve6to7
pve6to7 --full
```

> You should now see `/usr/bin/pve6to7` and the pre-upgrade checker output.

---

## 7️⃣ Fix any warnings from `pve6to7`

* Follow instructions from the checker.
* Make sure network, storage, and containers are compatible.

---

## 8️⃣ Upgrade to Proxmox 7

Once the checker shows no blockers:

1. Update Debian repos to **Bullseye**.
2. Update Proxmox 7 repos (no-subscription or enterprise).
3. Run `apt update && apt dist-upgrade` to move the system to Proxmox 7.

---

✅ After this, your lab server will be **fully upgraded to Proxmox 7**.

---

Perfect — this is exactly what we want to see 👍

Your system is **fully ready to upgrade to Proxmox 7**. Let’s break down the report:

---

## ✅ What passed

* Packages are up to date ✅
* `proxmox-ve` ≥ 6.4-1 ✅
* Running kernel is correct ✅
* Standalone node (no cluster) ✅
* Storage is active ✅
* Services (`pveproxy`, `pvedaemon`, `pvestatd`) ✅
* No running VMs/containers ✅
* Hostname resolves ✅
* No legacy LXC cgroup configs ✅
* Node/guest descriptions fit new limits ✅

---

## ⚠️ Warning

```
WARN: No Debian security repository detected in /etc/apt/sources.list and /etc/apt/sources.list.d/*.list
```

* This is **normal on archived Buster setup** — we pointed the system to `archive.debian.org` instead of the original security repo.
* **It’s safe to ignore** for the upgrade. Just know that after upgrading to Proxmox 7 (Bullseye), you’ll switch to Bullseye security repos.

---

## 🏁 Summary

* **TOTAL:** 20 checks
* **PASSED:** 16
* **SKIPPED:** 3
* **WARNINGS:** 1 (benign)
* **FAILURES:** 0 ✅

You are **cleared for upgrade**.

---

## 🔹 Next Steps: Upgrade to Proxmox 7

### 1️⃣ Update Debian from Buster → Bullseye

Edit `/etc/apt/sources.list`:

```bash
cat > /etc/apt/sources.list <<'EOF'
deb http://deb.debian.org/debian bullseye main contrib
deb http://deb.debian.org/debian bullseye-updates main contrib
deb http://security.debian.org/debian-security bullseye-security main contrib
EOF
```

### 2️⃣ Update Proxmox repo to 7 (no-subscription)

```bash
cat > /etc/apt/sources.list.d/pve-no-subscription.list <<'EOF'
deb http://download.proxmox.com/debian/pve bullseye pve-no-subscription
EOF
```

### 3️⃣ Update & upgrade

```bash
apt update
apt dist-upgrade -y
reboot
```

* This will upgrade your node to **Proxmox VE 7 + Debian Bullseye**
* Check kernel after reboot:

```bash
pveversion
uname -r
```

### 4️⃣ Final Checks

* Confirm services:

```bash
systemctl status pveproxy pvedaemon pvestatd
```

* Ensure storage is active:

```bash
pvesm status
```

---

After this, your lab server will be **fully upgraded to Proxmox 7** and ready for VMs/containers.

```lua
root@labinfo:~# pveversion
pve-manager/7.4-20/5d6e3351 (running kernel: 5.15.158-2-pve)
root@labinfo:~# uname -r
5.15.158-2-pve
root@labinfo:~# systemctl status pveproxy pvedaemon pvestatd
● pveproxy.service - PVE API Proxy Server
     Loaded: loaded (/lib/systemd/system/pveproxy.service; enabled; vendor preset: enabled)
     Active: active (running) since Sat 2026-01-24 18:31:14 EST; 1min 2s ago
    Process: 1082 ExecStartPre=/usr/bin/pvecm updatecerts --silent (code=exited, status=0/SUCCESS)
    Process: 1084 ExecStart=/usr/bin/pveproxy start (code=exited, status=0/SUCCESS)
   Main PID: 1086 (pveproxy)
      Tasks: 4 (limit: 77175)
     Memory: 205.1M
        CPU: 2.415s
     CGroup: /system.slice/pveproxy.service
             ├─1086 pveproxy
             ├─1087 pveproxy worker
             ├─1088 pveproxy worker
             └─1089 pveproxy worker

Jan 24 18:31:12 labinfo systemd[1]: Starting PVE API Proxy Server...
Jan 24 18:31:14 labinfo pveproxy[1086]: starting server
Jan 24 18:31:14 labinfo pveproxy[1086]: starting 3 worker(s)
Jan 24 18:31:14 labinfo pveproxy[1086]: worker 1087 started
Jan 24 18:31:14 labinfo pveproxy[1086]: worker 1088 started
Jan 24 18:31:14 labinfo pveproxy[1086]: worker 1089 started
Jan 24 18:31:14 labinfo systemd[1]: Started PVE API Proxy Server.

● pvedaemon.service - PVE API Daemon
     Loaded: loaded (/lib/systemd/system/pvedaemon.service; enabled; vendor preset: enabled)
     Active: active (running) since Sat 2026-01-24 18:31:12 EST; 1min 5s ago
    Process: 1047 ExecStart=/usr/bin/pvedaemon start (code=exited, status=0/SUCCESS)
   Main PID: 1077 (pvedaemon)
      Tasks: 4 (limit: 77175)
     Memory: 147.9M
        CPU: 1.795s
     CGroup: /system.slice/pvedaemon.service
             ├─1077 pvedaemon
             ├─1078 pvedaemon worker
             ├─1079 pvedaemon worker
             └─1080 pvedaemon worker

Jan 24 18:31:08 labinfo systemd[1]: Starting PVE API Daemon...
Jan 24 18:31:12 labinfo pvedaemon[1077]: starting server
Jan 24 18:31:12 labinfo pvedaemon[1077]: starting 3 worker(s)
Jan 24 18:31:12 labinfo pvedaemon[1077]: worker 1078 started
Jan 24 18:31:12 labinfo pvedaemon[1077]: worker 1079 started
Jan 24 18:31:12 labinfo pvedaemon[1077]: worker 1080 started
Jan 24 18:31:12 labinfo systemd[1]: Started PVE API Daemon.

● pvestatd.service - PVE Status Daemon
     Loaded: loaded (/lib/systemd/system/pvestatd.service; enabled; vendor preset: enabled)
     Active: active (running) since Sat 2026-01-24 18:31:11 EST; 1min 6s ago
    Process: 1048 ExecStart=/usr/bin/pvestatd start (code=exited, status=0/SUCCESS)
   Main PID: 1058 (pvestatd)
      Tasks: 1 (limit: 77175)
     Memory: 120.2M
        CPU: 1.884s
     CGroup: /system.slice/pvestatd.service
             └─1058 pvestatd

Jan 24 18:31:08 labinfo systemd[1]: Starting PVE Status Daemon...
Jan 24 18:31:11 labinfo pvestatd[1058]: starting server
Jan 24 18:31:11 labinfo systemd[1]: Started PVE Status Daemon.
root@labinfo:~# pvesm status
Name             Type     Status           Total            Used       Available        %
local             dir     active        69606648         3676504        62348604    5.28%
local-lvm     lvmthin     active       185892864               0       185892864    0.00%
```
