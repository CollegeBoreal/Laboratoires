
```bash
mdadm --zero-superblock /dev/nvme0n1
```
> -bash: mdadm: command not found

```
apt update && apt install mdadm -y
```
<details><summary>🪵 Log </summary>

```lua
Hit:1 http://deb.debian.org/debian bullseye InRelease
Get:2 http://security.debian.org/debian-security bullseye-security InRelease [27.2 kB]
Hit:3 http://deb.debian.org/debian bullseye-updates InRelease                                  
Hit:4 http://download.proxmox.com/debian/pve bullseye InRelease
Get:5 http://security.debian.org/debian-security bullseye-security/main amd64 Packages [455 kB]
Fetched 482 kB in 1s (439 kB/s)   
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
54 packages can be upgraded. Run 'apt list --upgradable' to see them.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Suggested packages:
  dracut-core
The following NEW packages will be installed:
  mdadm
0 upgraded, 1 newly installed, 0 to remove and 54 not upgraded.
Need to get 457 kB of archives.
After this operation, 1,261 kB of additional disk space will be used.
Get:1 http://deb.debian.org/debian bullseye/main amd64 mdadm amd64 4.1-11 [457 kB]
Fetched 457 kB in 0s (1,596 kB/s)
Preconfiguring packages ...
Selecting previously unselected package mdadm.
(Reading database ... 110040 files and directories currently installed.)
Preparing to unpack .../mdadm_4.1-11_amd64.deb ...
Unpacking mdadm (4.1-11) ...
Setting up mdadm (4.1-11) ...
Generating mdadm.conf... done.
update-initramfs: deferring update (trigger activated)
Generating grub configuration file ...
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 2998: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 2998: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3011: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3011: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3024: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3024: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3037: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3037: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3098: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3098: /usr/sbin/grub-probe
Found linux image: /boot/vmlinuz-5.15.158-2-pve
Found initrd image: /boot/initrd.img-5.15.158-2-pve
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3188: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3188: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3201: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3201: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3214: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3214: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3227: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3227: /usr/sbin/grub-probe
Found linux image: /boot/vmlinuz-5.4.203-1-pve
Found initrd image: /boot/initrd.img-5.4.203-1-pve
Found linux image: /boot/vmlinuz-5.4.106-1-pve
Found initrd image: /boot/initrd.img-5.4.106-1-pve
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3605: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3605: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3645: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3645: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3658: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3658: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3671: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3671: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3684: /usr/sbin/grub-probe
File descriptor 3 (pipe:[39271]) leaked on vgs invocation. Parent PID 3684: /usr/sbin/grub-probe
Found memtest86+ image: /boot/memtest86+.bin
Found memtest86+ multiboot image: /boot/memtest86+_multiboot.bin
Warning: os-prober will not be executed to detect other bootable partitions.
Systems on them will not be added to the GRUB boot configuration.
Check GRUB_DISABLE_OS_PROBER documentation entry.
done
update-rc.d: warning: start and stop actions are no longer supported; falling back to defaults
Processing triggers for man-db (2.9.4-2) ...
Processing triggers for initramfs-tools (0.140) ...
update-initramfs: Generating /boot/initrd.img-5.15.158-2-pve
Running hook script 'zz-proxmox-boot'..
Re-executing '/etc/kernel/postinst.d/zz-proxmox-boot' in new private mount namespace..
No /etc/kernel/proxmox-boot-uuids found, skipping ESP sync.
```

</details>

```bash
apt update && apt install dmraid -y
```
<details><summary>🪵 Log </summary>

```lua
Hit:1 http://download.proxmox.com/debian/pve bullseye InRelease
Hit:2 http://security.debian.org/debian-security bullseye-security InRelease
Hit:3 http://deb.debian.org/debian bullseye InRelease            
Hit:4 http://deb.debian.org/debian bullseye-updates InRelease
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
54 packages can be upgraded. Run 'apt list --upgradable' to see them.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  libdmraid1.0.0.rc16
The following NEW packages will be installed:
  dmraid libdmraid1.0.0.rc16
0 upgraded, 2 newly installed, 0 to remove and 54 not upgraded.
Need to get 137 kB of archives.
After this operation, 350 kB of additional disk space will be used.
Get:1 http://deb.debian.org/debian bullseye/main amd64 libdmraid1.0.0.rc16 amd64 1.0.0.rc16-8+b1 [101 kB]
Get:2 http://deb.debian.org/debian bullseye/main amd64 dmraid amd64 1.0.0.rc16-8+b1 [36.3 kB]
Fetched 137 kB in 0s (347 kB/s)   
Selecting previously unselected package libdmraid1.0.0.rc16.
(Reading database ... 110126 files and directories currently installed.)
Preparing to unpack .../libdmraid1.0.0.rc16_1.0.0.rc16-8+b1_amd64.deb ...
Unpacking libdmraid1.0.0.rc16 (1.0.0.rc16-8+b1) ...
Selecting previously unselected package dmraid.
Preparing to unpack .../dmraid_1.0.0.rc16-8+b1_amd64.deb ...
Unpacking dmraid (1.0.0.rc16-8+b1) ...
Setting up libdmraid1.0.0.rc16 (1.0.0.rc16-8+b1) ...
Setting up dmraid (1.0.0.rc16-8+b1) ...
update-initramfs: deferring update (trigger activated)
Processing triggers for man-db (2.9.4-2) ...
Processing triggers for libc-bin (2.31-13+deb11u13) ...
Processing triggers for initramfs-tools (0.140) ...
update-initramfs: Generating /boot/initrd.img-5.15.158-2-pve
Running hook script 'zz-proxmox-boot'..
Re-executing '/etc/kernel/postinst.d/zz-proxmox-boot' in new private mount namespace..
No /etc/kernel/proxmox-boot-uuids found, skipping ESP sync.
```

</details>
