Here are the CLI commands to install the NVIDIA driver on a Proxmox 8 host, combining the method using the official `.run` installer with the necessary preparation steps.

### 🛠️ 1. Host System Preparation
First, ensure your Proxmox host is ready, especially if **Secure Boot** is enabled.

*   **Remove Old Drivers (Cleanup)**: If other NVIDIA drivers were previously attempted, remove them first.
    ```bash
    # Remove drivers installed via .run package
    sudo /usr/bin/nvidia-uninstall
    ```
> sudo: cannot access '/usr/bin/nvidia-uninstall': No such file or directory    ```

    Or use:
    ```bash
    # Purge drivers installed via APT or DKMS
    apt purge -y --auto-remove '^nvidia.*'
    ```
<details><summary>🪵</summary>

```lua
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Note, selecting 'nvidia-tesla-450-vulkan-icd' for regex '^nvidia.*'
Note, selecting 'nvidia-primus-vk-common' for regex '^nvidia.*'
Note, selecting 'nvidia-libopencl1-dev' for regex '^nvidia.*'
Note, selecting 'nvidia-texture-tools' for regex '^nvidia.*'
Note, selecting 'nvidia-opencl-icd' for regex '^nvidia.*'
Note, selecting 'nvidia-tesla-440-driver' for regex '^nvidia.*'
Note, selecting 'nvidia-alternative' for regex '^nvidia.*'
Note, selecting 'nvidia-settings-gtk-390.144' for regex '^nvidia.*'
Note, selecting 'nvidia-primus-vk-wrapper' for regex '^nvidia.*'
Note, selecting 'nvidia-settings-gtk-460.91.03' for regex '^nvidia.*'
Note, selecting 'nvidia-vulkan-icd' for regex '^nvidia.*'
Note, selecting 'nvidia-legacy-390xx-driver-libs-nonglvnd' for regex '^nvidia.*'
Note, selecting 'nvidia-settings-legacy-390xx' for regex '^nvidia.*'
Note, selecting 'nvidia-tesla-450-driver' for regex '^nvidia.*'
Note, selecting 'nvidia-tesla-470-alternative' for regex '^nvidia.*'
Note, selecting 'nvidia-egl-wayland-common' for regex '^nvidia.*'
Note, selecting 'nvidia-xconfig' for regex '^nvidia.*'
Note, selecting 'nvidia-tesla-460-alternative' for regex '^nvidia.*'
Note, selecting 'nvidia-legacy-390xx-vdpau-driver' for regex '^nvidia.*'
Note, selecting 'nvidia-settings-gtk-470.141.03' for regex '^nvidia.*'
Note, selecting 'nvidia-tesla-450-alternative' for regex '^nvidia.*'
Note, selecting 'nvidia-alternative-legacy-96xx' for regex '^nvidia.*'
Note, selecting 'nvidia-driver-any' for regex '^nvidia.*'
Note, selecting 'nvidia-tesla-418-driver-libs-nonglvnd' for regex '^nvidia.*'
Note, selecting 'nvidia-alternative-legacy-173xx' for regex '^nvidia.*'
Note, selecting 'nvidia-legacy-390xx-opencl-icd' for regex '^nvidia.*'
Note, selecting 'nvidia-tesla-450-driver-libs' for regex '^nvidia.*'
Note, selecting 'nvidia-legacy-390xx-alternative' for regex '^nvidia.*'
Note, selecting 'nvidia-driver-libs' for regex '^nvidia.*'
Note, selecting 'nvidia-driver' for regex '^nvidia.*'
Note, selecting 'nvidia-current-updates' for regex '^nvidia.*'
Note, selecting 'nvidia-tesla-440-driver-libs' for regex '^nvidia.*'
Note, selecting 'nvidia-legacy-390xx-smi' for regex '^nvidia.*'
Note, selecting 'nvidia-tesla-460-vdpau-driver' for regex '^nvidia.*'
Note, selecting 'nvidia-support' for regex '^nvidia.*'
Note, selecting 'nvidia-current' for regex '^nvidia.*'
Note, selecting 'nvidia-tesla-470-vdpau-driver' for regex '^nvidia.*'
Note, selecting 'nvidia-tesla-418-alternative' for regex '^nvidia.*'
Note, selecting 'nvidia-kernel-common' for regex '^nvidia.*'
Note, selecting 'nvidia-legacy-390xx-vulkan-icd' for regex '^nvidia.*'
Note, selecting 'nvidia-legacy-340xx-driver' for regex '^nvidia.*'
Note, selecting 'nvidia-cuda-dev' for regex '^nvidia.*'
Note, selecting 'nvidia-cuda-doc' for regex '^nvidia.*'
Note, selecting 'nvidia-tesla-418-nonglvnd-vulkan-icd' for regex '^nvidia.*'
Note, selecting 'nvidia-tesla-418-driver' for regex '^nvidia.*'
Note, selecting 'nvidia-cuda-toolkit' for regex '^nvidia.*'
Note, selecting 'nvidia-settings-gtk-418.113' for regex '^nvidia.*'
Note, selecting 'nvidia-legacy-390xx-nonglvnd-vulkan-icd' for regex '^nvidia.*'
Note, selecting 'nvidia-driver-libs-any' for regex '^nvidia.*'
Note, selecting 'nvidia-settings' for regex '^nvidia.*'
Note, selecting 'nvidia-legacy-304xx-driver' for regex '^nvidia.*'
Note, selecting 'nvidia-tesla-440-vdpau-driver' for regex '^nvidia.*'
Note, selecting 'nvidia-settings-gtk-450.119.03' for regex '^nvidia.*'
Note, selecting 'nvidia-legacy-390xx-driver' for regex '^nvidia.*'
Note, selecting 'nvidia-tesla-450-vdpau-driver' for regex '^nvidia.*'
Note, selecting 'nvidia-libopencl1' for regex '^nvidia.*'
Note, selecting 'nvidia-legacy-390xx-driver-libs' for regex '^nvidia.*'
Note, selecting 'nvidia-vulkan-icd-any' for regex '^nvidia.*'
Note, selecting 'nvidia-legacy-340xx-vdpau-driver' for regex '^nvidia.*'
Note, selecting 'nvidia-tesla-418-vulkan-icd' for regex '^nvidia.*'
Note, selecting 'nvidia-tesla-418-driver-libs' for regex '^nvidia.*'
Note, selecting 'nvidia-settings-gtk-470.239.06' for regex '^nvidia.*'
Note, selecting 'nvidia-legacy-304xx-alternative' for regex '^nvidia.*'
Note, selecting 'nvidia-vdpau-driver' for regex '^nvidia.*'
Note, selecting 'nvidia-settings-tesla-418' for regex '^nvidia.*'
Note, selecting 'nvidia-settings-tesla-450' for regex '^nvidia.*'
Note, selecting 'nvidia-settings-tesla-460' for regex '^nvidia.*'
Note, selecting 'nvidia-settings-tesla-470' for regex '^nvidia.*'
Note, selecting 'nvidia-tesla-418-vdpau-driver' for regex '^nvidia.*'
Note, selecting 'nvidia-modprobe' for regex '^nvidia.*'
Note, selecting 'nvidia-tesla-440-vulkan-icd' for regex '^nvidia.*'
Note, selecting 'nvidia-alternative-legacy-71xx' for regex '^nvidia.*'
Note, selecting 'nvidia-legacy-340xx-alternative' for regex '^nvidia.*'
Note, selecting 'nvidia-persistenced' for regex '^nvidia.*'
Note, selecting 'nvidia-installer-cleanup' for regex '^nvidia.*'
Note, selecting 'nvidia-driver-binary' for regex '^nvidia.*'
Note, selecting 'nvidia-smi' for regex '^nvidia.*'
Package 'nvidia-driver' is not installed, so not removed
Package 'nvidia-egl-wayland-common' is not installed, so not removed
Package 'nvidia-opencl-icd' is not installed, so not removed
Package 'nvidia-smi' is not installed, so not removed
Package 'nvidia-cuda-toolkit' is not installed, so not removed
Package 'nvidia-cuda-dev' is not installed, so not removed
Package 'nvidia-vdpau-driver' is not installed, so not removed
Package 'nvidia-tesla-440-vdpau-driver' is not installed, so not removed
Package 'nvidia-tesla-418-vdpau-driver' is not installed, so not removed
Package 'nvidia-legacy-390xx-vdpau-driver' is not installed, so not removed
Package 'nvidia-legacy-340xx-vdpau-driver' is not installed, so not removed
Note, selecting 'libnvtt-bin' instead of 'nvidia-texture-tools'
Package 'nvidia-libopencl1-dev' is not installed, so not removed
Package 'nvidia-libopencl1' is not installed, so not removed
Package 'nvidia-current' is not installed, so not removed
Package 'nvidia-current-updates' is not installed, so not removed
Package 'nvidia-tesla-450-driver' is not installed, so not removed
Package 'nvidia-tesla-440-driver' is not installed, so not removed
Package 'nvidia-tesla-418-driver' is not installed, so not removed
Package 'nvidia-legacy-390xx-driver' is not installed, so not removed
Package 'nvidia-legacy-340xx-driver' is not installed, so not removed
Package 'nvidia-driver-any' is not installed, so not removed
Package 'nvidia-alternative' is not installed, so not removed
Package 'nvidia-alternative-legacy-173xx' is not installed, so not removed
Package 'nvidia-alternative-legacy-71xx' is not installed, so not removed
Package 'nvidia-alternative-legacy-96xx' is not installed, so not removed
Package 'nvidia-legacy-304xx-alternative' is not installed, so not removed
Package 'nvidia-legacy-304xx-driver' is not installed, so not removed
Package 'nvidia-legacy-340xx-alternative' is not installed, so not removed
Package 'nvidia-legacy-390xx-opencl-icd' is not installed, so not removed
Package 'nvidia-legacy-390xx-smi' is not installed, so not removed
Note, selecting 'nvidia-settings' instead of 'nvidia-settings-gtk-470.239.06'
Package 'nvidia-legacy-390xx-alternative' is not installed, so not removed
Note, selecting 'nvidia-settings-legacy-390xx' instead of 'nvidia-settings-gtk-390.144'
Package 'nvidia-tesla-418-alternative' is not installed, so not removed
Note, selecting 'nvidia-settings-tesla-418' instead of 'nvidia-settings-gtk-418.113'
Package 'nvidia-tesla-450-alternative' is not installed, so not removed
Note, selecting 'nvidia-settings-tesla-450' instead of 'nvidia-settings-gtk-450.119.03'
Package 'nvidia-tesla-450-vdpau-driver' is not installed, so not removed
Package 'nvidia-tesla-460-alternative' is not installed, so not removed
Note, selecting 'nvidia-settings-tesla-460' instead of 'nvidia-settings-gtk-460.91.03'
Package 'nvidia-tesla-460-vdpau-driver' is not installed, so not removed
Package 'nvidia-tesla-470-alternative' is not installed, so not removed
Note, selecting 'nvidia-settings-tesla-470' instead of 'nvidia-settings-gtk-470.141.03'
Package 'nvidia-tesla-470-vdpau-driver' is not installed, so not removed
Package 'nvidia-driver-binary' is not installed, so not removed
Package 'nvidia-driver-libs' is not installed, so not removed
Package 'nvidia-tesla-450-driver-libs' is not installed, so not removed
Package 'nvidia-tesla-440-driver-libs' is not installed, so not removed
Package 'nvidia-tesla-418-driver-libs' is not installed, so not removed
Package 'nvidia-tesla-418-driver-libs-nonglvnd' is not installed, so not removed
Package 'nvidia-legacy-390xx-driver-libs' is not installed, so not removed
Package 'nvidia-legacy-390xx-driver-libs-nonglvnd' is not installed, so not removed
Package 'nvidia-driver-libs-any' is not installed, so not removed
Package 'nvidia-vulkan-icd' is not installed, so not removed
Package 'nvidia-tesla-450-vulkan-icd' is not installed, so not removed
Package 'nvidia-tesla-440-vulkan-icd' is not installed, so not removed
Package 'nvidia-tesla-418-vulkan-icd' is not installed, so not removed
Package 'nvidia-tesla-418-nonglvnd-vulkan-icd' is not installed, so not removed
Package 'nvidia-legacy-390xx-vulkan-icd' is not installed, so not removed
Package 'nvidia-legacy-390xx-nonglvnd-vulkan-icd' is not installed, so not removed
Package 'nvidia-vulkan-icd-any' is not installed, so not removed
Package 'nvidia-cuda-doc' is not installed, so not removed
Package 'nvidia-modprobe' is not installed, so not removed
Package 'nvidia-persistenced' is not installed, so not removed
Package 'nvidia-settings' is not installed, so not removed
Package 'nvidia-settings-legacy-390xx' is not installed, so not removed
Package 'nvidia-settings-tesla-418' is not installed, so not removed
Package 'nvidia-settings-tesla-450' is not installed, so not removed
Package 'nvidia-settings-tesla-460' is not installed, so not removed
Package 'nvidia-settings-tesla-470' is not installed, so not removed
Package 'nvidia-installer-cleanup' is not installed, so not removed
Package 'nvidia-kernel-common' is not installed, so not removed
Package 'nvidia-support' is not installed, so not removed
Package 'nvidia-xconfig' is not installed, so not removed
Package 'nvidia-primus-vk-common' is not installed, so not removed
Package 'nvidia-primus-vk-wrapper' is not installed, so not removed
The following packages will be REMOVED:
  bsdmainutils*
0 upgraded, 0 newly installed, 1 to remove and 33 not upgraded.
After this operation, 27.6 kB disk space will be freed.
(Reading database ... 65722 files and directories currently installed.)
Removing bsdmainutils (12.1.7+nmu3) ...
(Reading database ... 65718 files and directories currently installed.)
Purging configuration files for bsdmainutils (12.1.7+nmu3) ...

```

</details>
    
*   **Check Secure Boot Status**: Use `mokutil --sb-state`. If **enabled**, you have two options:
    1.  **Disable in BIOS**: The simplest route, recommended if you have full control.
    2.  **Generate & enroll a Machine Owner Key (MOK)**: See the detailed guide below if you need to keep Secure Boot active.
*   **Install Build Tools**: You'll need the kernel headers and build tools to compile the driver.
    ```bash
    apt update
    ```
    <details><summary>🪵</summary>

    ```lua
    Get:1 http://security.debian.org/debian-security bullseye-security InRelease [27.2 kB]
    Hit:2 http://deb.debian.org/debian bullseye InRelease
    Hit:3 http://deb.debian.org/debian bullseye-updates InRelease
    Hit:4 http://download.proxmox.com/debian/pve bullseye InRelease
    Get:5 http://security.debian.org/debian-security bullseye-security/main amd64 Packages [456 kB]
    Fetched 483 kB in 1s (436 kB/s)    
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    33 packages can be upgraded. Run 'apt list --upgradable' to see them.
    ```

    </details>

    ```bash
    apt install build-essential dkms pve-headers-$(uname -r) -y
    ```
    <details><summary>🪵</summary>

    ```lua

    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    The following additional packages will be installed:
      cpp cpp-10 dctrl-tools dpkg-dev fakeroot g++ g++-10 gcc gcc-10 libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl libasan6
      libatomic1 libcc1-0 libdpkg-perl libfakeroot libfile-fcntllock-perl libgcc-10-dev libgomp1 libisl23 libitm1 liblsan0 libmpc3 libmpfr6 libstdc++-10-dev
      libtsan0 libubsan1 linux-compiler-gcc-10-x86 linux-headers-5.10.0-43-amd64 linux-headers-5.10.0-43-common linux-headers-amd64 linux-kbuild-5.10
      lsb-release make sudo
    Suggested packages:
      cpp-doc gcc-10-locales debtags menu debian-keyring g++-multilib g++-10-multilib gcc-10-doc gcc-multilib autoconf automake libtool flex bison gdb gcc-doc
      gcc-10-multilib git bzr libstdc++-10-doc make-doc
    The following NEW packages will be installed:
      build-essential cpp cpp-10 dctrl-tools dkms dpkg-dev fakeroot g++ g++-10 gcc gcc-10 libalgorithm-diff-perl libalgorithm-diff-xs-perl
      libalgorithm-merge-perl libasan6 libatomic1 libcc1-0 libdpkg-perl libfakeroot libfile-fcntllock-perl libgcc-10-dev libgomp1 libisl23 libitm1 liblsan0
      libmpc3 libmpfr6 libstdc++-10-dev libtsan0 libubsan1 linux-compiler-gcc-10-x86 linux-headers-5.10.0-43-amd64 linux-headers-5.10.0-43-common
      linux-headers-amd64 linux-kbuild-5.10 lsb-release make pve-headers-5.15.158-2-pve sudo
    0 upgraded, 39 newly installed, 0 to remove and 33 not upgraded.
    Need to get 78.6 MB of archives.
    After this operation, 334 MB of additional disk space will be used.
    Get:1 http://download.proxmox.com/debian/pve bullseye/pve-no-subscription amd64 pve-headers-5.15.158-2-pve amd64 5.15.158-2 [12.5 MB]
    Get:2 http://security.debian.org/debian-security bullseye-security/main amd64 linux-compiler-gcc-10-x86 amd64 5.10.251-5 [849 kB]
    Get:3 http://deb.debian.org/debian bullseye/main amd64 lsb-release all 11.1.0 [27.9 kB]                                   
    Get:4 http://deb.debian.org/debian bullseye/main amd64 libisl23 amd64 0.23-1 [676 kB]                                                  
    Get:5 http://security.debian.org/debian-security bullseye-security/main amd64 linux-headers-5.10.0-43-common all 5.10.251-5 [9,384 kB]
    Get:6 http://security.debian.org/debian-security bullseye-security/main amd64 linux-kbuild-5.10 amd64 5.10.251-5 [1,096 kB]                     
    Get:7 http://security.debian.org/debian-security bullseye-security/main amd64 linux-headers-5.10.0-43-amd64 amd64 5.10.251-5 [1,372 kB]
    Get:8 http://security.debian.org/debian-security bullseye-security/main amd64 linux-headers-amd64 amd64 5.10.251-5 [1,420 B]                
    Get:9 http://security.debian.org/debian-security bullseye-security/main amd64 sudo amd64 1.9.5p2-3+deb11u3 [1,059 kB]
    Get:10 http://deb.debian.org/debian bullseye/main amd64 libmpfr6 amd64 4.1.0-3 [2,012 kB]                                                                   
    Get:11 http://deb.debian.org/debian bullseye/main amd64 libmpc3 amd64 1.2.0-1 [45.0 kB]                                                                     
    Get:12 http://deb.debian.org/debian bullseye/main amd64 cpp-10 amd64 10.2.1-6 [8,528 kB]                                                                    
    Get:13 http://deb.debian.org/debian bullseye/main amd64 cpp amd64 4:10.2.1-1 [19.7 kB]                                                                      
    Get:14 http://deb.debian.org/debian bullseye/main amd64 libcc1-0 amd64 10.2.1-6 [47.0 kB]
    Get:15 http://deb.debian.org/debian bullseye/main amd64 libgomp1 amd64 10.2.1-6 [99.9 kB]
    Get:16 http://deb.debian.org/debian bullseye/main amd64 libitm1 amd64 10.2.1-6 [25.8 kB]
    Get:17 http://deb.debian.org/debian bullseye/main amd64 libatomic1 amd64 10.2.1-6 [9,008 B]
    Get:18 http://deb.debian.org/debian bullseye/main amd64 libasan6 amd64 10.2.1-6 [2,065 kB]
    Get:19 http://deb.debian.org/debian bullseye/main amd64 liblsan0 amd64 10.2.1-6 [828 kB]
    Get:20 http://deb.debian.org/debian bullseye/main amd64 libtsan0 amd64 10.2.1-6 [2,000 kB]
    Get:21 http://deb.debian.org/debian bullseye/main amd64 libubsan1 amd64 10.2.1-6 [777 kB]
    Get:22 http://deb.debian.org/debian bullseye/main amd64 libgcc-10-dev amd64 10.2.1-6 [2,328 kB]
    Get:23 http://deb.debian.org/debian bullseye/main amd64 gcc-10 amd64 10.2.1-6 [17.0 MB]
    Get:24 http://deb.debian.org/debian bullseye/main amd64 gcc amd64 4:10.2.1-1 [5,192 B]                                                                      
    Get:25 http://deb.debian.org/debian bullseye/main amd64 libdpkg-perl all 1.20.13 [1,552 kB]
    Get:26 http://deb.debian.org/debian bullseye/main amd64 make amd64 4.3-4.1 [396 kB]
    Get:27 http://deb.debian.org/debian bullseye/main amd64 dpkg-dev all 1.20.13 [2,314 kB]
    Get:28 http://deb.debian.org/debian bullseye/main amd64 libstdc++-10-dev amd64 10.2.1-6 [1,741 kB]
    Get:29 http://deb.debian.org/debian bullseye/main amd64 g++-10 amd64 10.2.1-6 [9,380 kB]
    Get:30 http://deb.debian.org/debian bullseye/main amd64 g++ amd64 4:10.2.1-1 [1,644 B]                                                                      
    Get:31 http://deb.debian.org/debian bullseye/main amd64 build-essential amd64 12.9 [7,704 B]                                                                
    Get:32 http://deb.debian.org/debian bullseye/main amd64 dctrl-tools amd64 2.24-3+b1 [104 kB]                                                                
    Get:33 http://deb.debian.org/debian bullseye/main amd64 dkms all 2.8.4-3 [78.2 kB]                                                                          
    Get:34 http://deb.debian.org/debian bullseye/main amd64 libfakeroot amd64 1.25.3-1.1 [47.0 kB]                                                              
    Get:35 http://deb.debian.org/debian bullseye/main amd64 fakeroot amd64 1.25.3-1.1 [87.0 kB]                                                                 
    Get:36 http://deb.debian.org/debian bullseye/main amd64 libalgorithm-diff-perl all 1.201-1 [43.3 kB]                                                        
    Get:37 http://deb.debian.org/debian bullseye/main amd64 libalgorithm-diff-xs-perl amd64 0.04-6+b1 [12.0 kB]                                                 
    Get:38 http://deb.debian.org/debian bullseye/main amd64 libalgorithm-merge-perl all 0.08-3 [12.7 kB]                                                        
    Get:39 http://deb.debian.org/debian bullseye/main amd64 libfile-fcntllock-perl amd64 0.22-3+b7 [35.5 kB]                                                    
    Fetched 78.6 MB in 1min 29s (881 kB/s)                                                                                                                      
    Extracting templates from packages: 100%
    Selecting previously unselected package lsb-release.
    (Reading database ... 65718 files and directories currently installed.)
    Preparing to unpack .../00-lsb-release_11.1.0_all.deb ...
    Unpacking lsb-release (11.1.0) ...
    Selecting previously unselected package libisl23:amd64.
    Preparing to unpack .../01-libisl23_0.23-1_amd64.deb ...
    Unpacking libisl23:amd64 (0.23-1) ...
    Selecting previously unselected package libmpfr6:amd64.
    Preparing to unpack .../02-libmpfr6_4.1.0-3_amd64.deb ...
    Unpacking libmpfr6:amd64 (4.1.0-3) ...
    Selecting previously unselected package libmpc3:amd64.
    Preparing to unpack .../03-libmpc3_1.2.0-1_amd64.deb ...
    Unpacking libmpc3:amd64 (1.2.0-1) ...
    Selecting previously unselected package cpp-10.
    Preparing to unpack .../04-cpp-10_10.2.1-6_amd64.deb ...
    Unpacking cpp-10 (10.2.1-6) ...
    Selecting previously unselected package cpp.
    Preparing to unpack .../05-cpp_4%3a10.2.1-1_amd64.deb ...
    Unpacking cpp (4:10.2.1-1) ...
    Selecting previously unselected package libcc1-0:amd64.
    Preparing to unpack .../06-libcc1-0_10.2.1-6_amd64.deb ...
    Unpacking libcc1-0:amd64 (10.2.1-6) ...
    Selecting previously unselected package libgomp1:amd64.
    Preparing to unpack .../07-libgomp1_10.2.1-6_amd64.deb ...
    Unpacking libgomp1:amd64 (10.2.1-6) ...
    Selecting previously unselected package libitm1:amd64.
    Preparing to unpack .../08-libitm1_10.2.1-6_amd64.deb ...
    Unpacking libitm1:amd64 (10.2.1-6) ...
    Selecting previously unselected package libatomic1:amd64.
    Preparing to unpack .../09-libatomic1_10.2.1-6_amd64.deb ...
    Unpacking libatomic1:amd64 (10.2.1-6) ...
    Selecting previously unselected package libasan6:amd64.
    Preparing to unpack .../10-libasan6_10.2.1-6_amd64.deb ...
    Unpacking libasan6:amd64 (10.2.1-6) ...
    Selecting previously unselected package liblsan0:amd64.
    Preparing to unpack .../11-liblsan0_10.2.1-6_amd64.deb ...
    Unpacking liblsan0:amd64 (10.2.1-6) ...
    Selecting previously unselected package libtsan0:amd64.
    Preparing to unpack .../12-libtsan0_10.2.1-6_amd64.deb ...
    Unpacking libtsan0:amd64 (10.2.1-6) ...
    Selecting previously unselected package libubsan1:amd64.
    Preparing to unpack .../13-libubsan1_10.2.1-6_amd64.deb ...
    Unpacking libubsan1:amd64 (10.2.1-6) ...
    Selecting previously unselected package libgcc-10-dev:amd64.
    Preparing to unpack .../14-libgcc-10-dev_10.2.1-6_amd64.deb ...
    Unpacking libgcc-10-dev:amd64 (10.2.1-6) ...
    Selecting previously unselected package gcc-10.
    Preparing to unpack .../15-gcc-10_10.2.1-6_amd64.deb ...
    Unpacking gcc-10 (10.2.1-6) ...
    Selecting previously unselected package gcc.
    Preparing to unpack .../16-gcc_4%3a10.2.1-1_amd64.deb ...
    Unpacking gcc (4:10.2.1-1) ...
    Selecting previously unselected package libdpkg-perl.
    Preparing to unpack .../17-libdpkg-perl_1.20.13_all.deb ...
    Unpacking libdpkg-perl (1.20.13) ...
    Selecting previously unselected package make.
    Preparing to unpack .../18-make_4.3-4.1_amd64.deb ...
    Unpacking make (4.3-4.1) ...
    Selecting previously unselected package dpkg-dev.
    Preparing to unpack .../19-dpkg-dev_1.20.13_all.deb ...
    Unpacking dpkg-dev (1.20.13) ...
    Selecting previously unselected package libstdc++-10-dev:amd64.
    Preparing to unpack .../20-libstdc++-10-dev_10.2.1-6_amd64.deb ...
    Unpacking libstdc++-10-dev:amd64 (10.2.1-6) ...
    Selecting previously unselected package g++-10.
    Preparing to unpack .../21-g++-10_10.2.1-6_amd64.deb ...
    Unpacking g++-10 (10.2.1-6) ...
    Selecting previously unselected package g++.
    Preparing to unpack .../22-g++_4%3a10.2.1-1_amd64.deb ...
    Unpacking g++ (4:10.2.1-1) ...
    Selecting previously unselected package build-essential.
    Preparing to unpack .../23-build-essential_12.9_amd64.deb ...
    Unpacking build-essential (12.9) ...
    Selecting previously unselected package dctrl-tools.
    Preparing to unpack .../24-dctrl-tools_2.24-3+b1_amd64.deb ...
    Unpacking dctrl-tools (2.24-3+b1) ...
    Setting up lsb-release (11.1.0) ...
    Selecting previously unselected package dkms.
    (Reading database ... 67403 files and directories currently installed.)
    Preparing to unpack .../00-dkms_2.8.4-3_all.deb ...
    Unpacking dkms (2.8.4-3) ...
    Selecting previously unselected package libfakeroot:amd64.
    Preparing to unpack .../01-libfakeroot_1.25.3-1.1_amd64.deb ...
    Unpacking libfakeroot:amd64 (1.25.3-1.1) ...
    Selecting previously unselected package fakeroot.
    Preparing to unpack .../02-fakeroot_1.25.3-1.1_amd64.deb ...
    Unpacking fakeroot (1.25.3-1.1) ...
    Selecting previously unselected package libalgorithm-diff-perl.
    Preparing to unpack .../03-libalgorithm-diff-perl_1.201-1_all.deb ...
    Unpacking libalgorithm-diff-perl (1.201-1) ...
    Selecting previously unselected package libalgorithm-diff-xs-perl.
    Preparing to unpack .../04-libalgorithm-diff-xs-perl_0.04-6+b1_amd64.deb ...
    Unpacking libalgorithm-diff-xs-perl (0.04-6+b1) ...
    Selecting previously unselected package libalgorithm-merge-perl.
    Preparing to unpack .../05-libalgorithm-merge-perl_0.08-3_all.deb ...
    Unpacking libalgorithm-merge-perl (0.08-3) ...
    Selecting previously unselected package libfile-fcntllock-perl.
    Preparing to unpack .../06-libfile-fcntllock-perl_0.22-3+b7_amd64.deb ...
    Unpacking libfile-fcntllock-perl (0.22-3+b7) ...
    Selecting previously unselected package linux-compiler-gcc-10-x86.
    Preparing to unpack .../07-linux-compiler-gcc-10-x86_5.10.251-5_amd64.deb ...
    Unpacking linux-compiler-gcc-10-x86 (5.10.251-5) ...
    Selecting previously unselected package linux-headers-5.10.0-43-common.
    Preparing to unpack .../08-linux-headers-5.10.0-43-common_5.10.251-5_all.deb ...
    Unpacking linux-headers-5.10.0-43-common (5.10.251-5) ...
    Selecting previously unselected package linux-kbuild-5.10.
    Preparing to unpack .../09-linux-kbuild-5.10_5.10.251-5_amd64.deb ...
    Unpacking linux-kbuild-5.10 (5.10.251-5) ...
    Selecting previously unselected package linux-headers-5.10.0-43-amd64.
    Preparing to unpack .../10-linux-headers-5.10.0-43-amd64_5.10.251-5_amd64.deb ...
    Unpacking linux-headers-5.10.0-43-amd64 (5.10.251-5) ...
    Selecting previously unselected package linux-headers-amd64.
    Preparing to unpack .../11-linux-headers-amd64_5.10.251-5_amd64.deb ...
    Unpacking linux-headers-amd64 (5.10.251-5) ...
    Selecting previously unselected package pve-headers-5.15.158-2-pve.
    Preparing to unpack .../12-pve-headers-5.15.158-2-pve_5.15.158-2_amd64.deb ...
    Unpacking pve-headers-5.15.158-2-pve (5.15.158-2) ...
    Selecting previously unselected package sudo.
    Preparing to unpack .../13-sudo_1.9.5p2-3+deb11u3_amd64.deb ...
    Unpacking sudo (1.9.5p2-3+deb11u3) ...
    Setting up pve-headers-5.15.158-2-pve (5.15.158-2) ...
    Setting up libfile-fcntllock-perl (0.22-3+b7) ...
    Setting up libalgorithm-diff-perl (1.201-1) ...
    Setting up linux-headers-5.10.0-43-common (5.10.251-5) ...
    Setting up libgomp1:amd64 (10.2.1-6) ...
    Setting up libfakeroot:amd64 (1.25.3-1.1) ...
    Setting up libasan6:amd64 (10.2.1-6) ...
    Setting up fakeroot (1.25.3-1.1) ...
    update-alternatives: using /usr/bin/fakeroot-sysv to provide /usr/bin/fakeroot (fakeroot) in auto mode
    Setting up make (4.3-4.1) ...
    Setting up libmpfr6:amd64 (4.1.0-3) ...
    Setting up libmpc3:amd64 (1.2.0-1) ...
    Setting up libatomic1:amd64 (10.2.1-6) ...
    Setting up sudo (1.9.5p2-3+deb11u3) ...
    Setting up libdpkg-perl (1.20.13) ...
    Setting up libubsan1:amd64 (10.2.1-6) ...
    Setting up linux-kbuild-5.10 (5.10.251-5) ...
    Setting up libisl23:amd64 (0.23-1) ...
    Setting up libalgorithm-diff-xs-perl (0.04-6+b1) ...
    Setting up libcc1-0:amd64 (10.2.1-6) ...
    Setting up liblsan0:amd64 (10.2.1-6) ...
    Setting up cpp-10 (10.2.1-6) ...
    Setting up dctrl-tools (2.24-3+b1) ...
    Setting up libitm1:amd64 (10.2.1-6) ...
    Setting up libalgorithm-merge-perl (0.08-3) ...
    Setting up libtsan0:amd64 (10.2.1-6) ...
    Setting up libgcc-10-dev:amd64 (10.2.1-6) ...
    Setting up dpkg-dev (1.20.13) ...
    Setting up gcc-10 (10.2.1-6) ...
    Setting up cpp (4:10.2.1-1) ...
    Setting up linux-compiler-gcc-10-x86 (5.10.251-5) ...
    Setting up libstdc++-10-dev:amd64 (10.2.1-6) ...
    Setting up g++-10 (10.2.1-6) ...
    Setting up gcc (4:10.2.1-1) ...
    Setting up dkms (2.8.4-3) ...
    Setting up g++ (4:10.2.1-1) ...
    update-alternatives: using /usr/bin/g++ to provide /usr/bin/c++ (c++) in auto mode
    Setting up linux-headers-5.10.0-43-amd64 (5.10.251-5) ...
    /etc/kernel/header_postinst.d/dkms:
    dkms: running auto installation service for kernel 5.10.0-43-amd64:.
    Setting up build-essential (12.9) ...
    Setting up linux-headers-amd64 (5.10.251-5) ...
    Processing triggers for man-db (2.9.4-2) ...
    Processing triggers for libc-bin (2.31-13+deb11u13) ...

    ```

    </details>

### 🚫 2. Disable the `nouveau` Driver
The built-in `nouveau` driver conflicts with the proprietary NVIDIA driver.

*   **Blacklist the Driver**: Create a config file:
    ```bash
    cat <<EOF | sudo tee /etc/modprobe.d/blacklist-nouveau.conf
    blacklist nouveau
    options nouveau modeset=0
    EOF
    ```
*   **Update Boot Image**:
    ```bash
    update-initramfs -u -k all
    ```
    Then **reboot** your Proxmox host (`reboot` command). After reboot, run `lsmod | grep nouveau` to ensure it's not loaded (should return nothing).

### 📥 3. Install the NVIDIA Driver
Now proceed with the installation on the host.

*   **Download the Driver**: Identify the appropriate version for your RTX A400 from the [NVIDIA Driver Download](https://www.nvidia.com/en-us/drivers/unix/linux-amd64-display-archive/) page and use `wget`.
    ```bash
    wget https://download.nvidia.com/XFree86/Linux-x86_64/<version>/NVIDIA-Linux-x86_64-<version>.run
    chmod +x NVIDIA-Linux-x86_64-<version>.run
    ```
    > **Note**: Replace `<version>` with the actual version number, e.g., `550.90.07`.

*   **Run the Installer**:
    ```bash
    ./NVIDIA-Linux-x86_64-<version>.run
    ```
    You will be asked a few questions; the recommended answers are `Yes` or `OK` for most, but do **not** answer yes if it asks to configure Xorg.

### ✅ 4. Verify & Cleanup
After installation, reboot your host one more time (`reboot` command). Once it's back up, run the following to verify the driver is correctly loaded and your GPU is detected.
```bash
nvidia-smi
```
If you see GPU information similar to the screenshot below, your installation is successful.

---

### 📝 5. Next Steps & Important Notes
*   **Optional: Persistence Mode**: To reduce the card's idle power consumption, you can enable this mode.
    ```bash
    nvidia-smi --persistence-mode=1
    ```
*   **For LXC Passthrough**: If you plan to pass the GPU to containers:
    *   The host's base driver is correctly installed.
    *   Ensure the `nvidia` kernel module is loaded (`lsmod | grep nvidia`).
    *   You'll need to mount the NVIDIA devices into the container by adding configurations to the container's `.conf` file.
*   **Troubleshooting**: See the official NVIDIA documentation or Proxmox forums for specific errors.

Hopefully, this detailed guide helps you get the driver up and running successfully. Since you'll be using it for local LLMs after the driver is set up, would you like me to help with the specific LXC or VM configurations for that next?
