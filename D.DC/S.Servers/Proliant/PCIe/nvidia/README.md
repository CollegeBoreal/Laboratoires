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
    apt install build-essential dkms pve-headers-$(uname -r) -y
    ```

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
