


## **balenaEtcher** via **Homebrew**

Install **balenaEtcher** via **Homebrew**, but the command is slightly different. Here’s the exact working way 👇

---

### 🧩 **Step-by-step: Install Etcher on macOS with Homebrew**

1. **Update Homebrew** (always a good idea):

   ```bash
   brew update
   ```

2. **Install Etcher (from the Cask repository):**

   ```bash
   brew install --cask balenaetcher
   ```

3. Once it finishes, you’ll see something like:

   ```
   🍺  balenaetcher was successfully installed!
   ```

4. **Launch it:**

   ```bash
   open /Applications/balenaEtcher.app
   ```

   Or open it from **Spotlight** (Cmd + Space → “Etcher”).

---

### 🧰 **After Installation**

1. Insert your USB stick (8 GB+).
2. Open Etcher →

   * **Select :link: Flash from URL:** [ubuntu-24.04-live-server-amd64.iso][ubuntu-24.04-live-server-amd64.iso]
   * **Select Target:** your USB drive
   * **Click Flash!**
3. Wait until Etcher says “Flash complete.”
4. Eject the USB safely:

   ```bash
   diskutil eject /dev/disk4
   ```

   (Replace `disk4` with your actual USB identifier if you want to be sure.)

---

### ⚙️ **Next Step**

Plug the USB into your **HP ProLiant DL380 G7**, press **F11** at boot, and select the USB device — it will boot straight into the Ubuntu 24.04 installer.

# :books: References

ubuntu-24.04-live-server-amd64.iso: https://mirror.arizona.edu/ubuntu-releases/24.04/ubuntu-24.04.3-live-server-amd64.iso

 :contentReference[oaicite:0]{index=0}

So the `wget` command would be something like:

```bash
wget https://mirror.arizona.edu/ubuntu-releases/24.04/ubuntu-24.04.3-live-server-amd64.iso
```
