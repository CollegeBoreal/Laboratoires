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

2. **Set XFCE as the RDP session** by creating `~/.xsession`:

```bash
echo "startxfce4" > ~/.xsession
chmod +x ~/.xsession
```

3. **Open firewall port** (if needed):

```bash
sudo ufw allow 3389/tcp
```

4. **Connect via RDP client**.

---

💡 Tip: Even though `xubuntu-desktop` installs XFCE, **xrdp won’t automatically pick it** — you still need the `.xsession` file to tell xrdp which desktop to start.

---

If you want, I can give you a **ready-to-run RDP setup command sequence** specifically for a system with `xubuntu-desktop` already installed, so it’s fully RDP-ready in one go. Do you want me to do that?
