Here are the CLI commands to install the NVIDIA driver on a Proxmox 8 host, combining the method using the official `.run` installer with the necessary preparation steps.

### 🛠️ 1. Host System Preparation
First, ensure your Proxmox host is ready, especially if **Secure Boot** is enabled.

*   **Remove Old Drivers (Cleanup)**: If other NVIDIA drivers were previously attempted, remove them first.
    ```bash
    # Remove drivers installed via .run package
    sudo /usr/bin/nvidia-uninstall
    ```
    Or use:
    ```bash
    # Purge drivers installed via APT or DKMS
    apt purge -y --auto-remove '^nvidia.*'
    ```
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
