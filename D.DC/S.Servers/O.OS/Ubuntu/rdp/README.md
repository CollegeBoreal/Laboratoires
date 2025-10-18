# 🔍 **Install xrdp**

✅ Installing `xubuntu-desktop` **already installs XFCE4** along with all the Xubuntu themes, apps, and goodies.

So if you’ve done:

```bash
sudo apt install xubuntu-desktop -y
```

then:

* `xfce4` is installed
* `xfce4-goodies` (extra utilities and plugins) is installed
* `lightdm` is installed as the display manager

---

### What this means for RDP:

You **don’t need to install XFCE separately**. You only need to:

1. **Install xrdp**:

```bash
sudo apt install xrdp -y
```
<details>

```lua
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  libpipewire-0.3-modules-xrdp pipewire-module-xrdp xorgxrdp
Suggested packages:
  guacamole
The following NEW packages will be installed:
  libpipewire-0.3-modules-xrdp pipewire-module-xrdp xorgxrdp xrdp
0 upgraded, 4 newly installed, 0 to remove and 0 not upgraded.
Need to get 626 kB of archives.
After this operation, 3,570 kB of additional disk space will be used.
Get:1 http://ca.archive.ubuntu.com/ubuntu noble/universe amd64 xrdp amd64 0.9.24-4 [536 kB]
Get:2 http://ca.archive.ubuntu.com/ubuntu noble/universe amd64 libpipewire-0.3-modules-xrdp amd64 0.2-2 [20.6 kB]
Get:3 http://ca.archive.ubuntu.com/ubuntu noble/universe amd64 pipewire-module-xrdp all 0.2-2 [3,800 B]
Get:4 http://ca.archive.ubuntu.com/ubuntu noble/universe amd64 xorgxrdp amd64 1:0.9.19-1 [65.3 kB]
Fetched 626 kB in 0s (1,544 kB/s)   
Selecting previously unselected package xrdp.
(Reading database ... 227614 files and directories currently installed.)
Preparing to unpack .../xrdp_0.9.24-4_amd64.deb ...
Unpacking xrdp (0.9.24-4) ...
Selecting previously unselected package libpipewire-0.3-modules-xrdp:amd64.
Preparing to unpack .../libpipewire-0.3-modules-xrdp_0.2-2_amd64.deb ...
Unpacking libpipewire-0.3-modules-xrdp:amd64 (0.2-2) ...
Selecting previously unselected package pipewire-module-xrdp.
Preparing to unpack .../pipewire-module-xrdp_0.2-2_all.deb ...
Unpacking pipewire-module-xrdp (0.2-2) ...
Selecting previously unselected package xorgxrdp.
Preparing to unpack .../xorgxrdp_1%3a0.9.19-1_amd64.deb ...
Unpacking xorgxrdp (1:0.9.19-1) ...
Setting up xrdp (0.9.24-4) ...

Generating 2048 bit rsa key...

ssl_gen_key_xrdp1 ok

saving to /etc/xrdp/rsakeys.ini

Created symlink /etc/systemd/system/multi-user.target.wants/xrdp-sesman.service → /usr/lib/systemd/system/xrdp-sesman.service.
Created symlink /etc/systemd/system/multi-user.target.wants/xrdp.service → /usr/lib/systemd/system/xrdp.service.
Setting up libpipewire-0.3-modules-xrdp:amd64 (0.2-2) ...
Setting up xorgxrdp (1:0.9.19-1) ...
Setting up pipewire-module-xrdp (0.2-2) ...
Processing triggers for man-db (2.12.0-4build2) ...
Processing triggers for libc-bin (2.39-0ubuntu8.6) ...
Scanning processes...                                                                                                                     
Scanning processor microcode...                                                                                                           
Scanning linux images...                                                                                                                  

Running kernel seems to be up-to-date.

The processor microcode seems to be up-to-date.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
```
  
</details>

2. **Set XFCE as the RDP session** by creating `~/.xsession`:

```bash
echo "startxfce4" > ~/.xsession
chmod +x ~/.xsession
```

3. **Open firewall port** (if needed):

```bash
sudo ufw allow 3389/tcp
```

## ✅ After doing all this:

Restart xRDP:

```bash
sudo systemctl restart xrdp
```
4. **Connect via RDP client**.

Reconnect via your RDP client and choose:

* **Session:** Xorg
* **Username:** 300099999
* **Password:** (your password)

---

💡 Tip: Even though `xubuntu-desktop` installs XFCE, **xrdp won’t automatically pick it** — you still need the `.xsession` file to tell xrdp which desktop to start.
