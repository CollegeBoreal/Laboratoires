# Sessions


## H26

| Cab | U | Etiquette | Host IP | RAM (GB) | CPU | DD (GB) | Proxmox | Check | Classes |
|-|-|-|-|-|-|-|-|-|-|
| :two: | 4️⃣0️⃣ | S13 | https://10.7.237.16:8006 | 64 | 16 | 272 | VE 7.4-20 | ⤴️ | [INF1102-201-26H-03](https://github.com/CollegeBoreal/INF1102-201-26H-03/blob/main/3.IaC/.scripts/Participation-group1.md) 🥇 |
| :two: | 0️⃣8️⃣ | S37 | https://10.7.237.13:8006 | 12 | 16 | 272 | VE 7.4-20 | ⤴️ | [INF1102-201-26H-03](https://github.com/CollegeBoreal/INF1102-201-26H-03/blob/main/3.IaC/.scripts/Participation-group2.md) 🥈 |
| :two: | 3️⃣5️⃣ | S18 | https://10.7.237.33:8006 | 64 | 16 | 272 | VE 7.4-20 | ⤴️ | [INF1102-201-26H-03](https://github.com/CollegeBoreal/INF1102-201-26H-03/blob/main/3.IaC/.scripts/Participation-group3.md) 🥉 |
| :two: | 3️⃣2️⃣ | S21 | https://10.7.237.19:8006 | 64 | 16 | 272 | VE 7.4-20 | ⤴️ | [INF1102-201-26H-05](https://github.com/CollegeBoreal/INF1102-201-26H-05/blob/main/3.IaC/.scripts/Participation-group1.md) 🥇 |
| :two: | | S25 | https://10.7.237.38:8006 | 64 | 16 | 272 | VE 7.4-20 | ⤴️ | [INF1102-201-26H-05](https://github.com/CollegeBoreal/INF1102-201-26H-05) 🥈 |
| :two: | 3️⃣6️⃣ | S17 | https://10.7.237.28:8006 | 64 | 16 | 272 | VE 7.4-20 | ⤴️ |


```python
root@labinfo:~# ip addr | grep vmbr0
2: enp2s0f0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq master vmbr0 state UP group default qlen 1000
4: vmbr0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    inet 10.7.237.10/23 brd 10.7.237.255 scope global vmbr0
root@labinfo:~# lsmem
RANGE                                  SIZE  STATE REMOVABLE BLOCK
0x0000000000000000-0x00000000dfffffff  3.5G online       yes  0-27
0x0000000100000000-0x000000031fffffff  8.5G online       yes 32-99

Memory block size:       128M
Total online memory:      12G
Total offline memory:      0B
```

---

## GRUB Edit


Perfect — that actually tells us **exactly which installer path you’re on**, and it changes the answer a bit.

On **that screen** (where you see only):

```
Install Proxmox VE
Advanced Options
```

👉 **YES**, pressing **`e`** on **`Install Proxmox VE`** still does what we need.

There is **no separate “Serial Console” entry** in this ISO/menu — that’s normal for some Proxmox 7.x builds and legacy BIOS.

---

## Exactly what to do (no guessing)

### 1️⃣ Highlight **Install Proxmox VE**

Use arrow keys so it’s selected.

---

### 2️⃣ Press **`e`**

You will see a **GRUB edit screen** (not a shell).

It will look similar to:

```
linux /boot/linux26 ro ramdisk_size=16777216 ...
initrd /boot/initrd.img
```

---

### 3️⃣ Edit the `linux` line

* Move the cursor to the **end of the line that starts with `linux`**
* Append **exactly**:

```
nomodeset text console=tty1
```

So the end looks like:

```
... quiet nomodeset text console=tty1
```

---

### 4️⃣ Boot with the edited entry

Press:

```
Ctrl + X
```

(or **F10**)

---

## What should happen if this works

* Installer stays **pure text**
* No graphical mode switch
* No black screen
* You can complete the install

---

## If the screen still goes black immediately

That tells us something very important:

> **Your G7 VGA path cannot be used at all with Proxmox 7.x**

At that point:

* METHOD 2 is **confirmed not viable**
* Only **iLO serial install** or **6.4 → 7.x upgrade** will work

---

## One more thing to try (last VGA attempt)

If `tty1` fails, try instead:

```
nomodeset video=vesafb:off console=tty0
```

or:

```
nomodeset console=ttyS0,115200
```

(Last one requires iLO serial console.)

---

## Straight talk (so you can decide)

* You are **not missing a menu**
* You are doing the **correct steps**
* HP ProLiant VGA + Linux 5.x is the real blocker
* iLO is the clean solution

