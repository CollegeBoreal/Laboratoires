

```bash
lsblk
```
<details><summary>🪵 After Installing PCIe/NVMe 1TB card</summary>

```lua
NAME                             MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda                                8:0    0 273.4G  0 disk 
├─sda1                             8:1    0  1007K  0 part 
├─sda2                             8:2    0   512M  0 part 
└─sda3                             8:3    0 272.9G  0 part 
  ├─pve-swap                     253:1    0     8G  0 lvm  [SWAP]
  ├─pve-root                     253:2    0    68G  0 lvm  /
  ├─pve-data_tmeta               253:3    0   1.8G  0 lvm  
  │ └─pve-data-tpool             253:5    0 177.3G  0 lvm  
  │   ├─pve-data                 253:6    0 177.3G  1 lvm  
  │   ├─pve-vm--9000--cloudinit  253:7    0     4M  0 lvm  
  │   ├─pve-vm--100--cloudinit   253:8    0     4M  0 lvm  
  │   └─pve-vm--100--disk--0     253:9    0   160G  0 lvm  
  └─pve-data_tdata               253:4    0 177.3G  0 lvm  
    └─pve-data-tpool             253:5    0 177.3G  0 lvm  
      ├─pve-data                 253:6    0 177.3G  1 lvm  
      ├─pve-vm--9000--cloudinit  253:7    0     4M  0 lvm  
      ├─pve-vm--100--cloudinit   253:8    0     4M  0 lvm  
      └─pve-vm--100--disk--0     253:9    0   160G  0 lvm  
sdb                                8:16   0 136.7G  0 disk 
└─fast--storage-vm--100--disk--0 253:0    0   120G  0 lvm  
nvme0n1                          259:0    0 953.9G  0 disk 
```

</details>

- [ ] Trying to create PV but device is not empty

```bash
pvcreate /dev/nvme0n1
```
> Cannot use /dev/nvme0n1: device is an md component

- [ ] View what's on it

```bash
cat /proc/mdstat
```
```
Personalities : 
unused devices: <none>
```

- [ ] Trying to erase what's on it

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

- [ ] Still can't

</details>

```bash
mdadm --zero-superblock /dev/nvme0n1
```
```
mdadm: /dev/nvme0n1 is not attached to Intel(R) RAID controller.
mdadm: /dev/nvme0n1 is not attached to Intel(R) RAID controller.
```

- [ ] Try with RAID

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

```bash
dmraid -rE /dev/nvme0n1
```
> no raid disks and with names: "/dev/nvme0n1"

- [ ] Let's wipe it out

```bash
wipefs -a /dev/nvme0n1
> /dev/nvme0n1: 8 bytes were erased at offset 0x00000218 (LVM2_member): 4c 56 4d 32 20 30 30 31

```bash
# début (metadata classique)
dd if=/dev/zero of=/dev/nvme0n1 bs=1M count=200
```
```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 0.305607 s, 686 MB/s
```

```
# fin du disque (ISW RAID se cache souvent là)
dd if=/dev/zero of=/dev/nvme0n1 bs=1M count=200 seek=$(( $(blockdev --getsz /dev/nvme0n1) / 2048 - 200 ))
```
```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 0.307004 s, 683 MB/s
```

- [ ] Anything left?

```bash
wipefs -a /dev/nvme0n1
```
(none)

```bash
lsblk -f
```
```lua
NAME                             FSTYPE      FSVER    LABEL  UUID                                   FSAVAIL FSUSE% MOUNTPOINT
sda                                                                                                                
├─sda1                                                                                                             
├─sda2                           vfat        FAT32           DE15-86D4                                             
└─sda3                           LVM2_member LVM2 001        NNZxnr-ff2Q-r53H-Xyrw-J4uO-ecjd-iVeUe7                
  ├─pve-swap                     swap        1               8509424a-4fa1-40ab-9cec-e796ba126b6e                  [SWAP]
  ├─pve-root                     ext4        1.0             856cea40-a6c7-43e0-aebb-c5577cc28a60     57.1G     9% /
  ├─pve-data_tmeta                                                                                                 
  │ └─pve-data-tpool                                                                                               
  │   ├─pve-data                                                                                                   
  │   ├─pve-vm--9000--cloudinit  iso9660              cidata 2026-02-23-19-16-18-00                                
  │   ├─pve-vm--100--cloudinit   iso9660              cidata 2026-06-03-16-14-33-00                                
  │   └─pve-vm--100--disk--0                                                                                       
  └─pve-data_tdata                                                                                                 
    └─pve-data-tpool                                                                                               
      ├─pve-data                                                                                                   
      ├─pve-vm--9000--cloudinit  iso9660              cidata 2026-02-23-19-16-18-00                                
      ├─pve-vm--100--cloudinit   iso9660              cidata 2026-06-03-16-14-33-00                                
      └─pve-vm--100--disk--0                                                                                       
sdb                              LVM2_member LVM2 001        k6DUPe-Beib-4nrc-J0Ye-8BKU-RC7I-UBUTfB                
└─fast--storage-vm--100--disk--0 ext4        1.0             c29e7c9c-0698-4f1d-9c86-d32f1a04eb77                  
nvme0n1
```

nothing left

- [ ] Finally, create the `Physical Volume` pv

```bash
pvcreate /dev/nvme0n1
```
>  Physical volume "/dev/nvme0n1" successfully created.

* extend `pve` volume group

```bash
vgextend pve /dev/nvme0n1
```
>  Volume group "pve" successfully extended

* extend all the `lv`

```
lvextend -l +100%FREE pve/data
```
```
  Size of logical volume pve/data_tdata changed from 177.28 GiB (45384 extents) to 1.12 TiB (293668 extents).
  Logical volume pve/data_tdata successfully resized.
```

- [ ] Check the LV and VG

```bash
lvs
```
```
  LV                VG           Attr       LSize   Pool Origin           Data%  Meta%  Move Log Cpy%Sync Convert
  vm-100-disk-0     fast-storage -wi-a----- 120.00g                                                              
  base-9000-disk-0  pve          Vri---tz-k  <2.20g data                                                         
  data              pve          twi-aotz--   1.12t                       6.41   2.46                            
  root              pve          -wi-ao----  68.00g                                                              
  swap              pve          -wi-ao----   8.00g                                                              
  vm-100-cloudinit  pve          Vwi-a-tz--   4.00m data                  9.38                                   
  vm-100-disk-0     pve          Vwi-a-tz-- 160.00g data base-9000-disk-0 45.69                                  
  vm-9000-cloudinit pve          Vwi-a-tz--   4.00m data                  9.38                                   
```

```bash
vgs
```
```
  VG           #PV #LV #SN Attr   VSize    VFree  
  fast-storage   1   1   0 wz--n- <136.70g <16.70g
  pve            2   7   0 wz--n-   <1.20t      0
```

```bash
pvesm status
```
```
Name                Type     Status           Total            Used       Available        %
fast-storage         lvm     active       143335424       125829120        17506304   87.79%
local                dir     active        69606648         6139652        59885456    8.82%
local-lvm        lvmthin     active      1202864128        77103590      1125760537    6.41%
```

```bash
systemctl enable fstrim.timer
systemctl start fstrim.timer
```
> Created symlink /etc/systemd/system/timers.target.wants/fstrim.timer → /lib/systemd/system/fstrim.timer.

