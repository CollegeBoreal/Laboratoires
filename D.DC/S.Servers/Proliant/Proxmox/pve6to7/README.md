# 🛠️ Upgrade Preparation & Full Update Script

Run all commands **as root**.

---

## 1️⃣ Backup

Make sure **all VMs, containers, and configs are backed up**.

```bash
# Example: backup all VMs
vzdump --all --storage local --mode snapshot
```

Never skip this step — in-place upgrades can fail.

---

## 2️⃣ Switch Debian repos to archive

```bash
# Replace /etc/apt/sources.list
cat > /etc/apt/sources.list <<'EOF'
deb http://archive.debian.org/debian buster main contrib
deb http://archive.debian.org/debian buster-updates main contrib
deb http://archive.debian.org/debian-security buster/updates main contrib
EOF
```

---

## 3️⃣ Switch Proxmox 6 repo to archive (no-subscription)

```bash
cat > /etc/apt/sources.list.d/pve-no-subscription.list <<'EOF'
deb http://archive.proxmox.com/debian/pve buster pve-no-subscription
EOF

# Disable enterprise repo if exists
sed -i 's/^deb/#deb/' /etc/apt/sources.list.d/pve-enterprise.list
```

---

## 4️⃣ Disable expired metadata check (required for archive repos)

```bash
cat > /etc/apt/apt.conf.d/99disable-check-valid-until <<'EOF'
Acquire::Check-Valid-Until "0";
EOF
```

---

## 5️⃣ Update & upgrade system

```bash
apt update
apt dist-upgrade -y
reboot
```

> After reboot, your system should have **latest Proxmox 6.4 packages** including `pve6to7`.

---

## 6️⃣ Verify `pve6to7`

```bash
pveversion
which pve6to7
pve6to7 --full
```

> You should now see `/usr/bin/pve6to7` and the pre-upgrade checker output.

---

## 7️⃣ Fix any warnings from `pve6to7`

* Follow instructions from the checker.
* Make sure network, storage, and containers are compatible.

---

## 8️⃣ Upgrade to Proxmox 7

Once the checker shows no blockers:

1. Update Debian repos to **Bullseye**.
2. Update Proxmox 7 repos (no-subscription or enterprise).
3. Run `apt update && apt dist-upgrade` to move the system to Proxmox 7.

---

✅ After this, your lab server will be **fully upgraded to Proxmox 7**.

---

If you want, I can make a **single ready-to-run bash script** that does steps 2–6 automatically, so you can just paste it on your lab server.

Do you want me to do that?
