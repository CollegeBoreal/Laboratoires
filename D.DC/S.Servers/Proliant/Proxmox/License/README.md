# License


> You do not have a valid subscription for this server. Please visit www.proxmox.com to get a list of available options.

That message is **normal** with Proxmox VE if you’re using it **without a paid subscription**. It’s a **warning**, not an error.

---

## What the message means

> **“You do not have a valid subscription for this server”**

* Proxmox is **open-source** and fully usable for free
* The warning appears because:

  * You are using the **enterprise repository** **without** a subscription
  * Or the subscription check is enabled but no license is installed
* **Your cluster, VMs, containers, backups, API, Terraform/OpenTofu, etc. still work**

👉 Nothing is broken.

---

## Recommended setup for free / homelab / lab use

### ✅ Use the **No-Subscription** repository

This avoids the warning during updates and is officially supported for non-paying users.

### 1️⃣ Disable the Enterprise repo

Edit:

```bash
nano /etc/apt/sources.list.d/pve-enterprise.list
```

Comment out the line:

```text
# deb https://enterprise.proxmox.com/debian/pve bookworm pve-enterprise
```

---

### 2️⃣ Enable the No-Subscription repo

Create or edit:

```bash
nano /etc/apt/sources.list.d/pve-no-subscription.list
```

Add:

```text
deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription
```

(Replace `bookworm` with `bullseye` if on PVE 7)

---

### 3️⃣ Update

```bash
apt update
apt full-upgrade -y
```

---

## (Optional) Hide the warning in the Web UI ⚠️

⚠️ **Purely cosmetic** – not officially recommended, but common in labs.

```bash
sed -i.bak 's/if (data.status !== "Active")/if (false)/' \
/usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js
```

Then refresh your browser.

> ⚠️ This file may be overwritten after upgrades.

---

## Do I need a subscription?

| Use case              | Subscription needed? |
| --------------------- | -------------------- |
| Homelab / Lab         | ❌ No                 |
| Learning / Teaching   | ❌ No                 |
| Production / Business | ✅ Recommended        |
| Enterprise support    | ✅ Required           |

Subscription benefits:

* Tested enterprise updates
* SLA & official support
* Helps fund Proxmox development

---

## TL;DR

* ✅ Your Proxmox install is **working correctly**
* ❌ No license does **not** break anything
* ✔️ Switch to **pve-no-subscription** repo
* ✔️ Ignore or hide the warning if desired

If you want, I can also:

* Verify your repos
* Check your Proxmox version
* Help you automate PVE with **OpenTofu / Terraform**
* Explain subscription differences per node

Just tell me 👍
