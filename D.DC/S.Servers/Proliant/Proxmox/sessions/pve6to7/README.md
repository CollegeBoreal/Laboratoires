# 🛠️ Upgrade Preparation & Full Update Script

Run all commands **as root**.

---

## :a: 🛠️ Upgrade Preparation

### 1️⃣ Backup

Make sure **all VMs, containers, and configs are backed up**.

```bash
# Example: backup all VMs
vzdump --all --storage local --mode snapshot
```
<details>

```lua
INFO: Starting Backup of VM 9000 (qemu)
INFO: Backup started at 2026-01-24 22:49:39
INFO: status = stopped
INFO: backup mode: stop
INFO: ionice priority: 7
INFO: VM Name: ubuntu-jammy-template
INFO: include disk 'scsi0' 'local-lvm:base-9000-disk-0' 2252M
INFO: creating vzdump archive '/var/lib/vz/dump/vzdump-qemu-9000-2026_01_24-22_49_39.vma'
INFO: starting template backup
INFO: /usr/bin/vma create -v -c /var/lib/vz/dump/vzdump-qemu-9000-2026_01_24-22_49_39.tmp/qemu-server.conf exec:cat > /var/lib/vz/dump/vzdump-qemu-9000-2026_01_24-22_49_39.dat drive-scsi0=/dev/pve/base-9000-disk-0
INFO: progress 0% 0/2361393152 0
INFO: progress 1% 23658496/2361393152 17195008
INFO: progress 2% 47251456/2361393152 40787968
INFO: progress 3% 70844416/2361393152 64380928
INFO: progress 4% 94502912/2361393152 88039424
INFO: progress 5% 118095872/2361393152 109981696
INFO: progress 6% 141688832/2361393152 115118080
INFO: progress 7% 165347328/2361393152 138776576
INFO: progress 8% 188940288/2361393152 157065216
INFO: progress 9% 212533248/2361393152 157065216
INFO: progress 10% 236191744/2361393152 157065216
INFO: progress 11% 259784704/2361393152 158109696
INFO: progress 12% 283377664/2361393152 158117888
INFO: progress 13% 307036160/2361393152 158117888
INFO: progress 14% 330629120/2361393152 158117888
INFO: progress 15% 354222080/2361393152 158744576
INFO: progress 16% 377880576/2361393152 158769152
INFO: progress 17% 401473536/2361393152 158773248
INFO: progress 18% 425066496/2361393152 159203328
INFO: progress 19% 448724992/2361393152 159272960
INFO: progress 20% 472317952/2361393152 159371264
INFO: progress 21% 495910912/2361393152 159555584
INFO: progress 22% 519569408/2361393152 160366592
INFO: progress 23% 543162368/2361393152 160894976
INFO: progress 24% 566755328/2361393152 160894976
INFO: progress 25% 590348288/2361393152 160956416
INFO: progress 26% 614006784/2361393152 161284096
INFO: progress 27% 637599744/2361393152 161361920
INFO: progress 28% 661192704/2361393152 161366016
INFO: progress 29% 684851200/2361393152 161419264
INFO: progress 30% 708444160/2361393152 161427456
INFO: progress 31% 732037120/2361393152 161427456
INFO: progress 32% 755695616/2361393152 161427456
INFO: progress 33% 779288576/2361393152 161427456
INFO: progress 34% 802881536/2361393152 162471936
INFO: progress 35% 826540032/2361393152 162537472
INFO: progress 36% 850132992/2361393152 162639872
INFO: progress 37% 873725952/2361393152 162729984
INFO: progress 38% 897384448/2361393152 162779136
INFO: progress 39% 920977408/2361393152 162852864
INFO: progress 40% 944570368/2361393152 162852864
INFO: progress 41% 968228864/2361393152 162852864
INFO: progress 42% 991821824/2361393152 162852864
INFO: progress 43% 1015414784/2361393152 162852864
INFO: progress 44% 1039073280/2361393152 162861056
INFO: progress 45% 1062666240/2361393152 163905536
INFO: progress 46% 1086259200/2361393152 163909632
INFO: progress 47% 1109917696/2361393152 163909632
INFO: progress 48% 1133510656/2361393152 163950592
INFO: progress 49% 1157103616/2361393152 163950592
INFO: progress 50% 1180696576/2361393152 163950592
INFO: progress 51% 1204355072/2361393152 163950592
INFO: progress 52% 1227948032/2361393152 163950592
INFO: progress 53% 1251540992/2361393152 163950592
INFO: progress 54% 1275199488/2361393152 163950592
INFO: progress 55% 1298792448/2361393152 163950592
INFO: progress 56% 1322385408/2361393152 165941248
INFO: progress 57% 1346043904/2361393152 171425792
INFO: progress 58% 1369636864/2361393152 171425792
INFO: progress 59% 1393229824/2361393152 171491328
INFO: progress 60% 1416888320/2361393152 171491328
INFO: progress 61% 1440481280/2361393152 174723072
INFO: progress 62% 1464074240/2361393152 181321728
INFO: progress 63% 1487732736/2361393152 192466944
INFO: progress 64% 1511325696/2361393152 216059904
INFO: progress 65% 1534918656/2361393152 239652864
INFO: progress 66% 1558577152/2361393152 263311360
INFO: progress 67% 1582170112/2361393152 286904320
INFO: progress 68% 1605763072/2361393152 310497280
INFO: progress 69% 1629421568/2361393152 334155776
INFO: progress 70% 1653014528/2361393152 357748736
INFO: progress 71% 1676607488/2361393152 381341696
INFO: progress 72% 1700265984/2361393152 405000192
INFO: progress 73% 1723858944/2361393152 428593152
INFO: progress 74% 1747451904/2361393152 452186112
INFO: progress 75% 1771044864/2361393152 475779072
INFO: progress 76% 1794703360/2361393152 499437568
INFO: progress 77% 1818296320/2361393152 523030528
INFO: progress 78% 1841889280/2361393152 546623488
INFO: progress 79% 1865547776/2361393152 565956608
INFO: progress 80% 1889140736/2361393152 565960704
INFO: progress 81% 1912733696/2361393152 583827456
INFO: progress 82% 1936392192/2361393152 599805952
INFO: progress 83% 1959985152/2361393152 607019008
INFO: progress 84% 1983578112/2361393152 630321152
INFO: progress 85% 2007236608/2361393152 642183168
INFO: progress 86% 2030829568/2361393152 642183168
INFO: progress 87% 2054422528/2361393152 642183168
INFO: progress 88% 2078081024/2361393152 642183168
INFO: progress 89% 2101673984/2361393152 642183168
INFO: progress 90% 2125266944/2361393152 642183168
INFO: progress 91% 2148925440/2361393152 642187264
INFO: progress 92% 2172518400/2361393152 642191360
INFO: progress 93% 2196111360/2361393152 642191360
INFO: progress 94% 2219769856/2361393152 642191360
INFO: progress 95% 2243362816/2361393152 642191360
INFO: progress 96% 2266955776/2361393152 645144576
INFO: progress 97% 2290614272/2361393152 646430720
INFO: progress 98% 2314207232/2361393152 646430720
INFO: progress 99% 2337800192/2361393152 646434816
INFO: progress 100% 2361393152/2361393152 646545408
INFO: image drive-scsi0: size=2361393152 zeros=646545408 saved=1714847744
INFO: archive file size: 1.60GB
INFO: Finished Backup of VM 9000 (00:00:12)
INFO: Backup finished at 2026-01-24 22:49:51
INFO: Backup job finished successfully
```
  
</details>

Never skip this step — in-place upgrades can fail.

---

### 2️⃣ Switch Debian repos to archive

```bash
# Replace /etc/apt/sources.list
cat > /etc/apt/sources.list <<'EOF'
deb http://archive.debian.org/debian buster main contrib
deb http://archive.debian.org/debian buster-updates main contrib
deb http://archive.debian.org/debian-security buster/updates main contrib
EOF
```

---

### 3️⃣ Switch Proxmox 6 repo to archive (no-subscription)

```bash
cat > /etc/apt/sources.list.d/pve-no-subscription.list <<'EOF'
deb http://archive.proxmox.com/debian/pve buster pve-no-subscription
EOF

# Disable enterprise repo if exists
sed -i 's/^deb/#deb/' /etc/apt/sources.list.d/pve-enterprise.list
```

---

### 4️⃣ Disable expired metadata check (required for archive repos)

```bash
cat > /etc/apt/apt.conf.d/99disable-check-valid-until <<'EOF'
Acquire::Check-Valid-Until "0";
EOF
```

---

### 5️⃣ Update & upgrade system

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

```bash
apt dist-upgrade -y
```
<details>

[logs/dist-upgrade-v6.md](logs/dist-upgrade-v6.md)

</details>


```bash
reboot
```

> After reboot, your system should have **latest Proxmox 6.4 packages** including `pve6to7`.

---

### 6️⃣ Verify `pve6to7`

```bash
pveversion
```
> pve-manager/6.4-15/af7986e6 (running kernel: 5.4.203-1-pve)

```bash
which pve6to7
```
> You should now see `/usr/bin/pve6to7` and the pre-upgrade checker output.

```bash
pve6to7 --full
```
<details>

```lua
= CHECKING VERSION INFORMATION FOR PVE PACKAGES =

Checking for package updates..
error reading cached package status in /var/lib/pve-manager/pkgupdates
PASS: all packages uptodate

Checking proxmox-ve package version..
PASS: proxmox-ve package has version >= 6.4-1

Checking running kernel version..
PASS: expected running kernel '5.4.203-1-pve'.

= CHECKING CLUSTER HEALTH/SETTINGS =

SKIP: standalone node.

= CHECKING HYPER-CONVERGED CEPH STATUS =

SKIP: no hyper-converged ceph setup detected!

= CHECKING CONFIGURED STORAGES =

PASS: storage 'local' enabled and active.
PASS: storage 'local-lvm' enabled and active.

= MISCELLANEOUS CHECKS =

INFO: Checking common daemon services..
PASS: systemd unit 'pveproxy.service' is in state 'active'
PASS: systemd unit 'pvedaemon.service' is in state 'active'
PASS: systemd unit 'pvestatd.service' is in state 'active'
INFO: Checking for running guests..
PASS: no running guest detected.
INFO: Checking if the local node's hostname 'labinfo' is resolvable..
INFO: Checking if resolved IP is configured on local node..
PASS: Resolved node IP '10.7.237.28' configured and active on single interface.
INFO: Checking backup retention settings..
INFO: storage 'local' - no backup retention settings defined - by default, PVE 7.x will no longer keep only the last backup, but all backups
PASS: no problems found.
INFO: checking CIFS credential location..
PASS: no CIFS credentials at outdated location found.
INFO: Checking custom roles for pool permissions..
INFO: Checking node and guest description/note legnth..
PASS: All node config descriptions fit in the new limit of 64 KiB
PASS: All guest config descriptions fit in the new limit of 8 KiB
INFO: Checking container configs for deprecated lxc.cgroup entries
PASS: No legacy 'lxc.cgroup' keys found.
INFO: Checking storage content type configuration..
PASS: no problems found
INFO: Checking if the suite for the Debian security repository is correct..
WARN: No Debian security repository detected in /etc/apt/sources.list and /etc/apt/sources.list.d/*.list
SKIP: No containers on node detected.

= SUMMARY =

TOTAL:    20
PASSED:   16
SKIPPED:  3
WARNINGS: 1
FAILURES: 0

ATTENTION: Please check the output for detailed information!
```

  
</details>


Your system is **fully ready to upgrade to Proxmox 7**. Let’s break down the report:

---

#### ✅ What passed

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

#### ⚠️ Warning

```
WARN: No Debian security repository detected in /etc/apt/sources.list and /etc/apt/sources.list.d/*.list
```

* This is **normal on archived Buster setup** — we pointed the system to `archive.debian.org` instead of the original security repo.
* **It’s safe to ignore** for the upgrade. Just know that after upgrading to Proxmox 7 (Bullseye), you’ll switch to Bullseye security repos.

---

#### 🏁 Summary

* **TOTAL:** 20 checks
* **PASSED:** 16
* **SKIPPED:** 3
* **WARNINGS:** 1 (benign)
* **FAILURES:** 0 ✅

You are **cleared for upgrade**.

---

## :b: 🔹 Next Steps: Upgrade to Proxmox 7

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
```
<details>

```lua
Get:1 http://security.debian.org/debian-security bullseye-security InRelease [27.2 kB]
Get:2 http://deb.debian.org/debian bullseye InRelease [75.1 kB]
Get:3 http://deb.debian.org/debian bullseye-updates InRelease [44.0 kB]
Get:4 http://download.proxmox.com/debian/pve bullseye InRelease [2,768 B]
Get:5 http://security.debian.org/debian-security bullseye-security/main amd64 Packages [443 kB]
Get:6 http://security.debian.org/debian-security bullseye-security/main Translation-en [296 kB]
Get:7 http://deb.debian.org/debian bullseye/main amd64 Packages [8,066 kB]          
Get:8 http://security.debian.org/debian-security bullseye-security/contrib amd64 Packages [2,880 B]
Get:9 http://security.debian.org/debian-security bullseye-security/contrib Translation-en [2,512 B]
Get:10 http://download.proxmox.com/debian/pve bullseye/pve-no-subscription amd64 Packages [452 kB]
Get:11 http://deb.debian.org/debian bullseye/main Translation-en [6,235 kB]
Get:12 http://deb.debian.org/debian bullseye/contrib amd64 Packages [50.4 kB]                     
Get:13 http://deb.debian.org/debian bullseye/contrib Translation-en [46.9 kB]
Get:14 http://deb.debian.org/debian bullseye-updates/main amd64 Packages [18.8 kB]
Get:15 http://deb.debian.org/debian bullseye-updates/main Translation-en [10.5 kB]
Fetched 15.8 MB in 4s (3,942 kB/s)                                 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
580 packages can be upgraded. Run 'apt list --upgradable' to see them.
```

  
</details>

```bash
apt dist-upgrade -y
```
<details>

[logs/dist-upgrade-v7.md](logs/dist-upgrade-v7.md)  

</details>


```lua
W: (pve-apt-hook) !! ATTENTION !!
W: (pve-apt-hook) You are attempting to upgrade from proxmox-ve '6.4-1' to proxmox-ve '7.4-1'. Please make sure to read the Upgrade notes at
W: (pve-apt-hook) 	https://pve.proxmox.com/wiki/Upgrade_from_6.x_to_7.0
W: (pve-apt-hook) before proceeding with this operation.
W: (pve-apt-hook) 
W: (pve-apt-hook) Press enter to continue, or C^c to abort.
```

✅ Press enter to continue,

<details>

```lua
apt-listchanges: Reading changelogs...
apt-listchanges: News
---------------------

apt (2.1.16) unstable; urgency=medium

  Automatically remove unused kernels on apt {dist,full}-upgrade. To revert
  to previous behavior, set APT::Get::AutomaticRemove::Kernels to false or
  pass --no-auto-remove to the command. apt-get remains unchanged.

  Packages files can now set the Phased-Update-Percentage field to restrict
  update rollout to a specified percentage of machines. Previously, this has
  only been available to users of Ubuntu's update-manager tool. See
  apt_preferences(5) for details and how to configure multiple systems to get
  the same updates. Phased updates are disabled in chroots for now to not
  break buildd-style setups.

 -- Julian Andres Klode <jak@debian.org>  Fri, 08 Jan 2021 22:01:50 +0100

apt (1.9.11) experimental; urgency=medium

  apt(8) now waits for the lock indefinitely if connected to a tty, or
  for 120 seconds if not.

 -- Julian Andres Klode <jak@debian.org>  Wed, 26 Feb 2020 20:30:33 +0100

apt (1.9.6) experimental; urgency=medium

  apt(8) no longer treats package names passed as regular expressions or fnmatch
  expressions, requiring the use of patterns (apt-patterns(5)) to perform complex
  searches. For ease of use, regular expressions starting with ^ or ending with
  $ continue to work.

  This fixes the problem where e.g. g++ could mean either "the package g++"
  or, if there is no g++ package, "all packages containing g". This change
  will propagate to apt-* after the release of Debian bullseye.

 -- Julian Andres Klode <jak@debian.org>  Wed, 15 Jan 2020 21:45:18 +0100

apt (1.9.5) unstable; urgency=medium

  Credentials in apt_auth.conf(5) now only apply to https and tor+https
  sources to avoid them being leaked over plaintext (Closes: #945911). To
  opt-in to http, add http:// before the hostname. Note that this will transmit
  credentials in plain text, which you do not want on devices that could be
  operating in an untrusted network.

 -- Julian Andres Klode <juliank@ubuntu.com>  Mon, 02 Dec 2019 11:45:52 +0100

bridge-utils (1.7-1) unstable; urgency=medium

  Linux kernel has changed bridge MAC address selection.

  In older Linux kernels the MAC of the bridge was the lower mac of the
  devices attached to it, this is no longer the case now at Bullseye. The
  kernel now makes up a completely new MAC address.

  This means that if you rely on your bridge's MAC address for something
  like DHCP leases or similar stuff you'll loose this feature. The only way
  to go back to your old MAC address is to assign it to the bridge
  explicitly using bridge_hw followed by the wanted MAC address on your
  bridge definition.
  
  To help with the problem caused by the kernel change of address selection
  (see below for more info on this) we have overloaded bridge_hw option so
  that you can specify the address you want or the name of an interface to
  take the MAC address from it.

  In the past setting the bridge hardware address was not considered safe,
  this is no longer a problem, currently it is necessary or recommended in a
  lot of scenarios like IPv6, DHCP reservations, ... the ussage of bridge_hw
  setting if the recommended way of doing this.

  Support for more than one stanza for one interface is now supported, see
  README and examples.

 -- Santiago Garcia Mantinan <manty@debian.org>  Wed, 24 Feb 2021 12:34:03 +0100

bsdmainutils (12.1.1) unstable; urgency=medium

  The "calendar" program, formerly provided in this package, now appears in
  the separate package "calendar".

  The tools "col", "colrm", "column", "hexdump", and "ul" are now provided as
  "bsdextrautils" from the util-linux sources.

 -- Michael Meskes <meskes@debian.org>  Wed, 27 May 2020 17:05:02 +0200

bsdmainutils (12.1.3) unstable; urgency=medium

  The tools "look" and "write" are also now part of "bsdextrautils" from the
  util-linux sources.

  The "from", "printerbanner", and "lorder" programs are discontinued. The
  "mailutils" package contains an alternative implementation of "from".

 -- Michael Meskes <meskes@debian.org>  Wed, 27 May 2020 17:05:02 +0200

chardet (3.0.4-6) unstable; urgency=medium

  Along with the drop of the Python2 package python-chardet, python3-chardet
  now provides the chardet and chardetect commands at /usr/bin/chardet and
  /usr/bin/chardetect.

  These commands are now Python3 commands.

 -- Pierre-Elliott Bécue <peb@debian.org>  Wed, 22 Apr 2020 16:56:27 +0200

glibc (2.31-5) unstable; urgency=medium

  Starting with glibc 2.31-5, the NIS and NIS+ name service modules
  libnss_nis.so.2.0.0 and libnss_nisplus.so.2.0.0 are not provided anymore by
  the libc6 package. People needing those modules have to install the
  libnss-nis and/or the libnss-nisplus packages, which are recommended by
  the libc6 package.

 -- Aurelien Jarno <aurel32@debian.org>  Tue, 01 Dec 2020 08:42:44 +0100

glibc (2.31-0experimental2) experimental; urgency=medium

  Starting with glibc 2.31, the DNS stub resolver does not blindly trust the
  AD (authenticated data) flag, indicating a DNSSEC validation:

  - By default the name servers and the network path to them are treated as
    untrusted. In this mode, the AD flag is not set in queries, and it is
    automatically cleared in responses, indicating a lack of DNSSEC
    validation.

  - A new trust-ad option, set via the options directive in /etc/resolv.conf
    (or if RES_TRUSTAD is set in _res.options), indicates that the name
    server is trusted. In this mode, the AD bit, as provided by the name
    server, is made available to the applications.

  Therefore if you trust your name servers, for example because you use a
  locally running validating resolver (e.g. unbound, systemd-resolved or
  dnsmasq), you might want to add the following line to /etc/resolv.conf:

    options trust-ad

 -- Aurelien Jarno <aurel32@debian.org>  Sun, 17 May 2020 15:59:38 +0200

gnupg2 (2.2.27-2) unstable; urgency=medium

  Starting with version 2.2.27-1, per-user configuration of the GnuPG
  suite has completely moved to ~/.gnupg/gpg.conf, and ~/.gnupg/options
  is no longer in use.  Please rename the file if necessary, or move
  its contents to the new location.

 -- Christoph Biedl <debian.axhn@manchmal.in-ulm.de>  Thu, 22 Apr 2021 20:37:45 +0200

gnupg2 (2.2.17-1) unstable; urgency=medium

  Upstream GnuPG now defaults to not accepting third-party certifications
  from the keyserver network.  Given that the SKS keyserver network is
  under attack via certificate flooding, and third-party certifications
  will not be accepted anyway, we now ship with the more tightly-constrained
  and abuse-resistant system hkps://keys.openpgp.org as the default
  keyserver.

  Users with bandwidth to spare who want to try their luck with the SKS
  pool should add the following line to ~/.gnupg/dirmngr.conf to revert to
  upstream's default keyserver:

      keyserver hkps://hkps.pool.sks-keyservers.net

  See the 2.2.17 section in the upstream NEWS file at
  /usr/share/doc/gnupg/NEWS.gz for more information about fully
  reverting to the old, risky behavior.

 -- Daniel Kahn Gillmor <dkg@fifthhorseman.net>  Thu, 11 Jul 2019 22:12:07 -0400

ifenslave (2.10) unstable; urgency=medium

  This version of the ifenslave package no longer provides /sbin/ifenslave. The
  /sbin/ip command from the iproute2 package supports creating bonding masters
  and enslaving other interfaces to it.

 -- Guus Sliepen <guus@debian.org>  Tue, 08 May 2018 22:47:07 +0200

iptables (1.8.4-1) unstable; urgency=medium

    All the iptables binaries have been moved away from /sbin to /usr/sbin.
    Compatibility symlinks were provided during the Buster release, but they
    have been dropped now.
    Please make sure your scripts aren't using hardcoded binary paths.
    .
    Also, please note that iptables is no longer Priority: important. This
    means it is not installed by default in every system. It has been replaced
    by nftables.

 -- Arturo Borrero Gonzalez <arturo@debian.org>  Wed,  04 Dec 2019 11:49:00 +0200

libanyevent-perl (7.150-1) unstable; urgency=medium

  [ INCOMPATIBLE CHANGE]
  AnyEvent::Handle's tls_detect documentation gave separate major and minor
  versions, while code passed only a single value. This version follows the
  documentation and now passes separate major and minor values.

 -- gregor herrmann <gregoa@debian.org>  Fri, 19 Jul 2019 12:16:42 -0300

libjson-xs-perl (4.020-1) unstable; urgency=medium

  * Security implication: this release enables allow_nonref by default
    for compatibility with RFC 7159 and newer. See "old" vs. "new"
    JSON under SECURITY CONSIDERATIONS in JSON::XS POD.

 -- intrigeri <intrigeri@debian.org>  Sun, 21 Jul 2019 15:13:24 +0000

libyaml-libyaml-perl (0.81+repack-1) unstable; urgency=medium

  YAML::XS 0.81 sets the default for $YAML::XS::LoadBlessed to false in order
  to avoid loading untrusted objects, which can be a security vulnerability.

  Cf. http://blogs.perl.org/users/tinita/2020/01/making-yamlpm-yamlsyck-and-yamlxs-safer-by-default.html
  for background information and hints for handling this change.

 -- gregor herrmann <gregoa@debian.org>  Wed, 29 Jan 2020 12:14:41 +0100

node-jquery (3.5.1+dfsg+~3.5.5-7) unstable; urgency=medium

  * Files pre-compressed with brotli compression now use suffix .brotli,
    to avoid clashing with ISO 639-1 language code for breton.

 -- Jonas Smedegaard <dr@jones.dk>  Tue, 12 Jan 2021 21:53:11 +0100

open-iscsi (2.1.2-1) unstable; urgency=medium

  open-iscsi is now linked with the OpenSSL library. With the change,
  the build of open-iscsi in Debian, is close to what upstream expects

  The decision to link to OpenSSL library was made based on the recent
  conclusions of Debian FTP Master team

 -- Ritesh Raj Sarraf <rrs@debian.org>  Sun, 15 Nov 2020 12:48:14 +0530

openssh (1:8.4p1-1) unstable; urgency=medium

  OpenSSH 8.4 includes a number of changes that may affect existing
  configurations:

   * ssh-keygen(1): the format of the attestation information optionally
     recorded when a FIDO key is generated has changed. It now includes the
     authenticator data needed to validate attestation signatures. 

   * The API between OpenSSH and the FIDO token middleware has changed and
     the SSH_SK_VERSION_MAJOR version has been incremented as a result.
     Third-party middleware libraries must support the current API version
     (7) to work with OpenSSH 8.4.

 -- Colin Watson <cjwatson@debian.org>  Sun, 18 Oct 2020 12:07:48 +0100

openssh (1:8.3p1-1) unstable; urgency=medium

  OpenSSH 8.3 includes a number of changes that may affect existing
  configurations:

  * sftp(1): reject an argument of "-1" in the same way as ssh(1) and scp(1)
    do instead of accepting and silently ignoring it.

 -- Colin Watson <cjwatson@debian.org>  Sun, 07 Jun 2020 13:44:04 +0100

openssh (1:8.2p1-1) unstable; urgency=medium

  OpenSSH 8.2 includes a number of changes that may affect existing
  configurations:

   * ssh(1), sshd(8), ssh-keygen(1): This release removes the "ssh-rsa"
     (RSA/SHA1) algorithm from those accepted for certificate signatures
     (i.e.  the client and server CASignatureAlgorithms option) and will use
     the rsa-sha2-512 signature algorithm by default when the ssh-keygen(1)
     CA signs new certificates.

     Certificates are at special risk to SHA1 collision vulnerabilities as
     an attacker has effectively unlimited time in which to craft a
     collision that yields them a valid certificate, far more than the
     relatively brief LoginGraceTime window that they have to forge a host
     key signature.

     The OpenSSH certificate format includes a CA-specified (typically
     random) nonce value near the start of the certificate that should make
     exploitation of chosen-prefix collisions in this context challenging,
     as the attacker does not have full control over the prefix that
     actually gets signed. Nonetheless, SHA1 is now a demonstrably broken
     algorithm and further improvements in attacks are highly likely.

     OpenSSH releases prior to 7.2 do not support the newer RSA/SHA2
     algorithms and will refuse to accept certificates signed by an OpenSSH
     8.2+ CA using RSA keys unless the unsafe algorithm is explicitly
     selected during signing ("ssh-keygen -t ssh-rsa").  Older
     clients/servers may use another CA key type such as ssh-ed25519
     (supported since OpenSSH 6.5) or one of the ecdsa-sha2-nistp256/384/521
     types (supported since OpenSSH 5.7) instead if they cannot be upgraded.

   * ssh(1), sshd(8): Remove diffie-hellman-group14-sha1 from the default
     key exchange proposal for both the client and server.

   * ssh-keygen(1): The command-line options related to the generation and
     screening of safe prime numbers used by the
     diffie-hellman-group-exchange-* key exchange algorithms have changed.
     Most options have been folded under the -O flag.

   * sshd(8): The sshd listener process title visible to ps(1) has changed
     to include information about the number of connections that are
     currently attempting authentication and the limits configured by
     MaxStartups.

 -- Colin Watson <cjwatson@debian.org>  Fri, 21 Feb 2020 16:36:37 +0000

openssh (1:8.1p1-1) unstable; urgency=medium

  OpenSSH 8.1 includes a number of changes that may affect existing
  configurations:

   * ssh-keygen(1): when acting as a CA and signing certificates with an RSA
     key, default to using the rsa-sha2-512 signature algorithm.
     Certificates signed by RSA keys will therefore be incompatible with
     OpenSSH versions prior to 7.2 unless the default is overridden (using
     "ssh-keygen -t ssh-rsa -s ...").

 -- Colin Watson <cjwatson@debian.org>  Thu, 10 Oct 2019 10:23:19 +0100

openssh (1:8.0p1-1) experimental; urgency=medium

  OpenSSH 8.0 includes a number of changes that may affect existing
  configurations:

   * sshd(8): Remove support for obsolete "host/port" syntax.
     Slash-separated host/port was added in 2001 as an alternative to
     host:port syntax for the benefit of IPv6 users.  These days there are
     established standards for this like [::1]:22 and the slash syntax is
     easily mistaken for CIDR notation, which OpenSSH supports for some
     things.  Remove the slash notation from ListenAddress and PermitOpen.

 -- Colin Watson <cjwatson@debian.org>  Sun, 09 Jun 2019 22:47:27 +0100

rpcbind (1.2.5-8) unstable; urgency=medium

  Since version 1.2.5 upstream has turned off the remote calls functionality
  in order to improve security. This can be turned on at build time.
  This functionality caused rpcbind to open up random listening ports. This
  change broke up broadcasts requests to rpcbind making systems depending
  on this feature unusable, e.g. NIS systems.
  
  This release accepts the new command line parameter 'r' to turn on the
  remote calls functionality when needed.

 -- Josue Ortega <josue@debian.org>  Tue, 17 Sep 2019 19:08:34 -0600

rpcbind (1.2.5-4) unstable; urgency=medium

  rpcbind now ships a default configuration file under '/etc/default'. If
  /etc/rpcbind.conf exists the default configuration file values will
   be overridden.

 -- Josue Ortega <josue@debian.org>  Sat, 27 Jul 2019 15:10:35 -0300

rsync (3.2.3-4+deb11u1) bullseye; urgency=medium

  The --copy-devices option has been reintroduced, it was previously removed in
  favor of the new one --write-devices, but it turns out they are not equivalent
  enough and upstream is providing the copy-devices patch on rsync-patches.

  Please beware that although the --copy-devices option is provided by
  upstream, it is not part of the official rsync package and it could be
  dropped or changed in ways that are not backwards compatible, though this would
  only happen between Debian releases.

  That being said, we will not drop this option from the Debian packaging as
  long as upstream keeps providing the patch under rsync-patches.

 -- Samuel Henrique <samueloph@debian.org>  Sun, 12 Sep 2021 17:25:37 +0100

rsync (3.2.0-1) unstable; urgency=low

  This latest release changed two parameters which used to be present on the
  Debian packaging of rsync as upstream now integrated the patches.

  Previous parameter:
  --copy-devices: write to devices as files (implies --inplace)
  Is now called: --write-devices

  Previous parameter:
  --noatime: avoid changing the atime on opened files.
  Is now called: --open-noatime

  Please refer to the manpage rsync(1) for more information.

 -- Samuel Henrique <samueloph@debian.org>  Sat, 20 Jun 2020 18:05:57 +0100

rsync (3.1.3-8) unstable; urgency=medium

  Some useful rsync scripts that used to be installed in
  /usr/share/doc/rsync/scripts are now installed in
  /usr/share/rsync/scripts. All of them have execution permission.

  The rrsync script is now deployed into /usr/bin/rrsync as a
  symlink to /usr/share/rsync/scripts/rrsync.

 -- Samuel Henrique <samueloph@debian.org>  Tue, 15 Oct 2019 01:04:36 +0100

scowl (2019.10.06-1) unstable; urgency=medium

  * The scowl binary package now distributes all of its wordlists in UTF-8
    rather than iso8859-1. This is different than the upstream default of
    iso8859-1.

 -- Don Armstrong <don@debian.org>  Sun, 29 Mar 2020 16:12:29 -0700

shadow (1:4.7-1) unstable; urgency=medium

  * /etc/securetty is no longer shipped by this package and it is no longer
    honored in login's PAM configuration by default. Please see #731656 for the
    details.

 -- Balint Reczey <rbalint@ubuntu.com>  Thu, 20 Jun 2019 13:46:52 +0200

systemd (247.2-2) unstable; urgency=medium

  systemd now defaults to the "unified" cgroup hierarchy (i.e. cgroupv2).
  This change reflects the fact that cgroupsv2 support has matured
  substantially in both systemd and in the kernel.
  All major container tools nowadays should support cgroupv2.
  If you run into problems with cgroupv2, you can switch back to the previous,
  hybrid setup by adding "systemd.unified_cgroup_hierarchy=false" to the
  kernel command line.
  You can read more about the benefits of cgroupv2 at
  https://www.kernel.org/doc/html/latest/admin-guide/cgroup-v2.html

 -- Michael Biebl <biebl@debian.org>  Mon, 21 Dec 2020 18:40:10 +0100

systemd (247.2-1) unstable; urgency=medium

  KERNEL API INCOMPATIBILITY: Linux 4.14 introduced two new uevents
  "bind" and "unbind" to the Linux device model. When this kernel
  change was made, systemd-udevd was only minimally updated to handle
  and propagate these new event types. The introduction of these new
  uevents (which are typically generated for USB devices and devices
  needing a firmware upload before being functional) resulted in a
  number of issues which we so far didn't address. We hoped the kernel
  maintainers would themselves address these issues in some form, but
  that did not happen. To handle them properly, many (if not most) udev
  rules files shipped in various packages need updating, and so do many
  programs that monitor or enumerate devices with libudev or sd-device,
  or otherwise process uevents. Please note that this incompatibility
  is not fault of systemd or udev, but caused by an incompatible kernel
  change that happened back in Linux 4.14, but is becoming more and
  more visible as the new uevents are generated by more kernel drivers.

  To learn more about the required udev rules changes please check the
  "CHANGES WITH 247" section of /usr/share/doc/systemd/NEWS.gz.

 -- Balint Reczey <rbalint@ubuntu.com>  Fri, 11 Dec 2020 18:22:42 +0100

tcpdump (4.99.0-1) unstable; urgency=medium

  tcpdump is now installed to /usr/bin, not /usr/sbin.

 -- Romain Francoise <rfrancoise@debian.org>  Sun, 03 Jan 2021 21:23:34 +0100

grep (3.6-1) unstable; urgency=low

  From upstream's NEWS:

  The GREP_OPTIONS environment variable no longer affects grep's behavior.
  The variable was declared obsolescent in grep 2.21 (2014), and since
  then any use had caused grep to issue a diagnostic.

 -- Santiago Ruano Rincón <santiago@debian.org>  Mon, 09 Nov 2020 10:57:22 +0100

apt-listchanges: Mailing root: apt-listchanges: news for labinfo
Extracting templates from packages: 100%
```

</details>

<img src=images/package-keyboard-conf.png width='50%' height='50%' > </img>

✅ Press enter to continue,

```lua
Preconfiguring packages ...
(Reading database ... 51517 files and directories currently installed.)
Preparing to unpack .../base-files_11.1+deb11u11_amd64.deb ...
Unpacking base-files (11.1+deb11u11) over (10.3+deb10u13) ...
Setting up base-files (11.1+deb11u11) ...
Installing new version of config file /etc/debian_version ...
Installing new version of config file /etc/dpkg/origins/debian ...

Configuration file '/etc/issue'
 ==> Modified (by you or by a script) since installation.
 ==> Package distributor has shipped an updated version.
   What would you like to do about it ?  Your options are:
    Y or I  : install the package maintainer's version
    N or O  : keep your currently-installed version
      D     : show the differences between the versions
      Z     : start a shell to examine the situation
 The default action is to keep your current version.
*** issue (Y/I/N/O/D/Z) [default=N] ?
```

Ah — this is a **standard Debian config prompt** during a `dist-upgrade`. It’s asking what to do with `/etc/issue`, which is the file that shows the “login banner” text.

Here’s what each option does:

| Option    | Meaning                                                                                                                  |
| --------- | ------------------------------------------------------------------------------------------------------------------------ |
| **Y / I** | Install the **maintainer’s version** — replace your current `/etc/issue` with the new default from Debian 11 (Bullseye). |
| **N / O** | Keep your **current version** — do not change `/etc/issue`.                                                              |
| **D**     | Show the **diff** between your version and the new one.                                                                  |
| **Z**     | Drop to a shell to inspect manually.                                                                                     |

---

### Recommendation for `/etc/issue`

* If you **haven’t customized the login banner**, press **Y** (or just Enter if Y is default).
* If you **want to keep your custom message**, press **N**.

> This is **purely cosmetic** — it does not affect system functionality or the Proxmox upgrade.

---

You can go ahead and choose **Y** to install the new version safely. After this, the upgrade will continue automatically.

---

<details>

```lua
Installing new version of config file /etc/issue ...
Installing new version of config file /etc/issue.net ...
Updating /etc/profile to current default.
Updating /root/.profile to current default.
(Reading database ... 51517 files and directories currently installed.)
Preparing to unpack .../debianutils_4.11.2_amd64.deb ...
Unpacking debianutils (4.11.2) over (4.8.6.1) ...
Setting up debianutils (4.11.2) ...
(Reading database ... 51517 files and directories currently installed.)
Preparing to unpack .../bash_5.1-2+deb11u1_amd64.deb ...
Unpacking bash (5.1-2+deb11u1) over (5.0-4) ...
Setting up bash (5.1-2+deb11u1) ...
update-alternatives: using /usr/share/man/man7/bash-builtins.7.gz to provide /usr/share/man/man7/builtins.7.gz (builtins.7.gz) in auto mode
(Reading database ... 51518 files and directories currently installed.)
Preparing to unpack .../bsdmainutils_12.1.7+nmu3_all.deb ...
renamed '/etc/default/bsdmainutils' -> '/etc/default/bsdmainutils.dpkg-remove'
renamed '/etc/cron.daily/bsdmainutils' -> '/etc/cron.daily/bsdmainutils.dpkg-remove'
Unpacking bsdmainutils (12.1.7+nmu3) over (11.1.2+b1) ...
dpkg: warning: unable to delete old directory '/etc/calendar': Directory not empty
Selecting previously unselected package bsdextrautils.
Preparing to unpack .../bsdextrautils_2.36.1-8+deb11u2_amd64.deb ...
Unpacking bsdextrautils (2.36.1-8+deb11u2) ...
Selecting previously unselected package gcc-10-base:amd64.
Preparing to unpack .../gcc-10-base_10.2.1-6_amd64.deb ...
Unpacking gcc-10-base:amd64 (10.2.1-6) ...
Setting up gcc-10-base:amd64 (10.2.1-6) ...
Selecting previously unselected package libgcc-s1:amd64.
(Reading database ... 51439 files and directories currently installed.)
Preparing to unpack .../libgcc-s1_10.2.1-6_amd64.deb ...
Unpacking libgcc-s1:amd64 (10.2.1-6) ...
Replacing files in old package libgcc1:amd64 (1:8.3.0-6) ...
Setting up libgcc-s1:amd64 (10.2.1-6) ...
Selecting previously unselected package libcrypt1:amd64.
(Reading database ... 51441 files and directories currently installed.)
Preparing to unpack .../libcrypt1_1%3a4.4.18-4_amd64.deb ...
Unpacking libcrypt1:amd64 (1:4.4.18-4) ...
Replacing files in old package libc6:amd64 (2.28-10+deb10u4) ...
Setting up libcrypt1:amd64 (1:4.4.18-4) ...
(Reading database ... 51446 files and directories currently installed.)
Preparing to unpack .../libzstd1_1.4.8+dfsg-2.1_amd64.deb ...
Unpacking libzstd1:amd64 (1.4.8+dfsg-2.1) over (1.3.8+dfsg-3+deb10u2) ...
Setting up libzstd1:amd64 (1.4.8+dfsg-2.1) ...
(Reading database ... 51446 files and directories currently installed.)
Preparing to unpack .../libpcre2-8-0_10.36-2+deb11u1_amd64.deb ...
Unpacking libpcre2-8-0:amd64 (10.36-2+deb11u1) over (10.32-5+deb10u1) ...
Setting up libpcre2-8-0:amd64 (10.36-2+deb11u1) ...
(Reading database ... 51446 files and directories currently installed.)
Preparing to unpack .../libselinux1_3.1-3_amd64.deb ...
Unpacking libselinux1:amd64 (3.1-3) over (2.8-1+b1) ...
Setting up libselinux1:amd64 (3.1-3) ...
Selecting previously unselected package libjson-c5:amd64.
(Reading database ... 51445 files and directories currently installed.)
Preparing to unpack .../libjson-c5_0.15-2+deb11u1_amd64.deb ...
Unpacking libjson-c5:amd64 (0.15-2+deb11u1) ...
Preparing to unpack .../libblkid1_2.36.1-8+deb11u2_amd64.deb ...
Unpacking libblkid1:amd64 (2.36.1-8+deb11u2) over (2.33.1-0.1+deb10u1) ...
Setting up libblkid1:amd64 (2.36.1-8+deb11u2) ...
(Reading database ... 51453 files and directories currently installed.)
Preparing to unpack .../0-dmsetup_2%3a1.02.175-2.1_amd64.deb ...
Unpacking dmsetup (2:1.02.175-2.1) over (2:1.02.155-pve4) ...
Preparing to unpack .../1-rpcbind_1.2.5-9_amd64.deb ...
Unpacking rpcbind (1.2.5-9) over (1.2.5-0.3+deb10u1) ...
Preparing to unpack .../2-libc-l10n_2.31-13+deb11u13_all.deb ...
Unpacking libc-l10n (2.31-13+deb11u13) over (2.28-10+deb10u4) ...
Preparing to unpack .../3-locales_2.31-13+deb11u13_all.deb ...
Unpacking locales (2.31-13+deb11u13) over (2.28-10+deb10u4) ...
Selecting previously unselected package libcbor0:amd64.
Preparing to unpack .../4-libcbor0_0.5.0+dfsg-2_amd64.deb ...
Unpacking libcbor0:amd64 (0.5.0+dfsg-2) ...
Selecting previously unselected package libfido2-1:amd64.
Preparing to unpack .../5-libfido2-1_1.6.0-2_amd64.deb ...
Unpacking libfido2-1:amd64 (1.6.0-2) ...
Preparing to unpack .../6-openssh-client_1%3a8.4p1-5+deb11u5_amd64.deb ...
Unpacking openssh-client (1:8.4p1-5+deb11u5) over (1:7.9p1-10+deb10u4) ...
Selecting previously unselected package runit-helper.
Preparing to unpack .../7-runit-helper_2.10.3_all.deb ...
Unpacking runit-helper (2.10.3) ...
Preparing to unpack .../8-openssh-server_1%3a8.4p1-5+deb11u5_amd64.deb ...
Unpacking openssh-server (1:8.4p1-5+deb11u5) over (1:7.9p1-10+deb10u4) ...
Preparing to unpack .../9-libc6_2.31-13+deb11u13_amd64.deb ...
Checking for services that may need to be restarted...
Checking init scripts...
Unpacking libc6:amd64 (2.31-13+deb11u13) over (2.28-10+deb10u4) ...
Setting up libc6:amd64 (2.31-13+deb11u13) ...
Checking for services that may need to be restarted...
Checking init scripts...

Restarting services possibly affected by the upgrade:
```

</details>

> Restarting services possibly affected by the upgrade:

<img src=images/package-restarting-services.png width='50%' height='50%' > </img>

✅ Choose `<yes>` to continue,

<details>

[logs/dist-upgrade-v7-2.md](logs/dist-upgrade-v7-2.md)

</details>

```lua
Configuration file '/etc/apt/sources.list.d/pve-enterprise.list'
 ==> Modified (by you or by a script) since installation.
 ==> Package distributor has shipped an updated version.
   What would you like to do about it ?  Your options are:
    Y or I  : install the package maintainer's version
    N or O  : keep your currently-installed version
      D     : show the differences between the versions
      Z     : start a shell to examine the situation
 The default action is to keep your current version.
*** pve-enterprise.list (Y/I/N/O/D/Z) [default=N] ?
```

Ah — same type of prompt, but this one is **very important for Proxmox repos**.

You are being asked about:

```
/etc/apt/sources.list.d/pve-enterprise.list
```

Which is your **enterprise repository file**. You had already **disabled it** (commented out) earlier because you’re using **no-subscription**.

---

### ✅ What to do here

* Press **N** (or just Enter, since default=N)

  * This **keeps your current version**, which is correct — your `pve-enterprise.list` is already disabled.
  * Installing the maintainer’s version would re-enable the enterprise repo, which you **do not want** for a lab/no-subscription setup.

---

💡 Tip: During Proxmox/Debian upgrades, you will often see config prompts for files you modified.
**Rule of thumb:**

* If you intentionally modified it (like disabling enterprise repo) → **keep your version (N)**
* If it’s purely default/system config you never touched → **install maintainer version (Y)**

---

You can safely proceed with **N** here.

---

```lua
Installing new version of config file /etc/modprobe.d/pve-blacklist.conf ...
Installing new version of config file /etc/vzdump.conf ...
Created symlink /etc/systemd/system/multi-user.target.wants/pvescheduler.service → /lib/systemd/system/pvescheduler.service.
machine-id check OK
Backing up lvm.conf before setting pve-manager specific settings..
'/etc/lvm/lvm.conf' -> '/etc/lvm/lvm.conf.bak'
Setting 'global_filter' in /etc/lvm/lvm.conf to prevent zvols from being scanned:
global_filter=["a|.*|"] => global_filter=["r|/dev/zd.*|"]
Setting up proxmox-ve (7.4-1) ...
Processing triggers for libc-bin (2.31-13+deb11u13) ...
Processing triggers for ca-certificates (20210119) ...
Updating certificates in /etc/ssl/certs...
0 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d...
done.
Processing triggers for initramfs-tools (0.140) ...
update-initramfs: Generating /boot/initrd.img-5.15.158-2-pve
Running hook script 'zz-proxmox-boot'..
Re-executing '/etc/kernel/postinst.d/zz-proxmox-boot' in new private mount namespace..
No /etc/kernel/proxmox-boot-uuids found, skipping ESP sync.
Processing triggers for pve-ha-manager (3.6.1) ...
```

```bash
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
