# pve6to7


### 🔍 What’s happening

You’re on **pve-manager 6.4-4**, and in that build the **`pve6to7` script is NOT included yet**.

The upgrade checker was added in a **later 6.4 update** (mid/late 6.4.x).
So the command not being found is **expected** at this version.

👉 Bottom line: **you must fully update Proxmox 6.4 first**.

---

## ✅ Step 1 — Fix your Proxmox repositories

From your earlier context, you’re almost certainly missing the **correct Proxmox repo** (or it’s disabled).

### If you **do NOT have a subscription** (most labs)

Create / fix this file:

```bash
nano /etc/apt/sources.list.d/pve-no-subscription.list
```

Put **exactly** this inside:

```text
deb http://download.proxmox.com/debian/pve buster pve-no-subscription
```

Then **disable enterprise repo** (if present):

```bash
nano /etc/apt/sources.list.d/pve-enterprise.list
```

Comment it out:

```text
# deb https://enterprise.proxmox.com/debian/pve buster pve-enterprise
```

Save & exit.

---

## ✅ Step 2 — Fully update Proxmox 6.4

Now run:

```bash
apt update
apt dist-upgrade
```

If you see **kernel updates**, reboot:

```bash
reboot
```

After reboot, confirm:

```bash
pveversion
```

You want something like:

```
pve-manager/6.4-1x/xxxxxxxx
```

(anything **higher than 6.4-4** is fine)

---

## ✅ Step 3 — `pve6to7` will now exist

Check again:

```bash
which pve6to7
```

Then run:

```bash
pve6to7 --full
```

🎉 Now you’re officially in the **safe upgrade path**.

---

## 🧠 Why Proxmox does this

The upgrade checker was backported **late** in the 6.4 lifecycle.
Systems frozen on early 6.4 (like yours) won’t have it until repositories are fixed and updated.

---

## 🚦Next step

Once you run `pve6to7 --full`, paste the **warnings section only**, and I’ll tell you:

* what’s safe to ignore
* what must be fixed **before** moving to Proxmox 7
* whether an in-place upgrade or clean reinstall is smarter for *your* lab

You’re doing everything right — this is exactly how a clean upgrade should start 👍
