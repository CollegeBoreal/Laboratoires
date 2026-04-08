# ZFS CAP 


Here’s a clean recap of what you need to do to **cap ZFS memory (ARC)** on your Proxmox system.

---

# 🧠 Goal

Prevent **ZFS** from consuming too much RAM and starving:

* your VM (Vivado / PetaLinux)
* the host system

---

# ⚙️ 1. Set a hard ARC limit (main fix)

Create or edit:

```bash
sudo nano /etc/modprobe.d/zfs.conf
```

Add ONE of these:

### Recommended (safe for your 32 GB system)

```bash
options zfs zfs_arc_max=6442450944
```

👉 = **6 GB max ARC**

---

### More relaxed (if you want more caching)

```bash
options zfs zfs_arc_max=8589934592
```

👉 = **8 GB max ARC**

---

# ⚙️ 2. (Optional but recommended) set minimum ARC

```bash
options zfs zfs_arc_min=1073741824
```

👉 keeps ARC from aggressively pre-allocating too much memory
👉 ~1 GB minimum

---

# 🔁 3. Apply changes

Run:

```bash
sudo update-initramfs -u
sudo reboot
```

---

# 📊 4. Verify after reboot

Check ARC limit:

```bash
cat /proc/spl/kstat/zfs/arcstats | grep c_max
```

You should see ~6–8 GB max.

---

# 🧪 5. Optional monitoring

Install and watch:

```bash
arcstat 1
```

or:

```bash
htop
```

---

# ⚠️ Why this matters (your case)

Without this cap:

* ZFS grows dynamically
* competes with VM memory
* Vivado installer spikes RAM usage
* system hits **memory deadlock → freeze (no reboot)**

---

# 🏁 Final recommended setting for you

For your Dell Precision 3460 (32 GB RAM):

👉 **Best stable config:**

* ARC max: **6 GB**
* VM: **16 GB**
* swap: **16 GB**
* tmpfs `/tmp`: **4 GB**

---


```bash
df -h
```
```lua
Filesystem        Size  Used Avail Use% Mounted on
udev               16G     0   16G   0% /dev
tmpfs             3.2G  1.7M  3.2G   1% /run
rpool/ROOT/pve-1  1.8T  2.2G  1.8T   1% /
tmpfs              16G   46M   16G   1% /dev/shm
efivarfs          438K  262K  172K  61% /sys/firmware/efi/efivars
tmpfs             5.0M     0  5.0M   0% /run/lock
tmpfs              16G     0   16G   0% /tmp
tmpfs             1.0M     0  1.0M   0% /run/credentials/systemd-journald.service
rpool             1.8T  256K  1.8T   1% /rpool
rpool/var-lib-vz  1.8T  128K  1.8T   1% /var/lib/vz
rpool/ROOT        1.8T  128K  1.8T   1% /rpool/ROOT
rpool/data        1.8T  128K  1.8T   1% /rpool/data
/dev/fuse         128M   16K  128M   1% /etc/pve
tmpfs             1.0M     0  1.0M   0% /run/credentials/getty@tty1.service
tmpfs             3.2G  4.0K  3.2G   1% /run/user/0
```

Parfait 👍 ton retour `df -h` est très intéressant — et **tout est OK** 👇

---

# 🧠 Ce que tu as actuellement (analyse)

Tu utilises :

👉 **ZFS avec un pool `rpool` (~1.8 To)**
➡️ donc très probablement un **RAIDZ1 avec tes 3 disques de 1TB**

---

## 📊 Structure actuelle

* `/` → `rpool/ROOT/pve-1` (système Proxmox)
* `/var/lib/vz` → stockage par défaut Proxmox
* `rpool/data` → stockage ZFS pour VM / containers
* `rpool` → pool global

👉 Tout est **normal et bien configuré automatiquement** 👍

---

# ⚠️ Pourquoi tout est à 1% ?

C’est normal :

* installation fraîche
* aucune VM encore
* ZFS réserve de l’espace intelligemment

---

# 📦 Où stocker tes VM ?

👉 Proxmox utilise généralement :

## ✔️ `local-zfs` (lié à `rpool/data`)

C’est ici que vont :

* VM disks
* containers

👉 équivalent à :

```bash
rpool/data
```

---

# 🔍 Vérifier dans Proxmox (GUI)

Dans l’interface web :

👉 Datacenter → Storage

Tu devrais voir :

* `local` → ISO / backups
* `local-zfs` → VM disks

---

# 💡 Bonne pratique (important)

## 🔹 1. ISO et templates

➡️ stockés dans :

```bash
/var/lib/vz
```

## 🔹 2. VM / containers

➡️ stockés dans :

```bash
rpool/data
```

---

# 🚀 Optimisation conseillée (optionnel)

Si tu veux faire propre :

## 📁 Créer datasets ZFS séparés

```bash
zfs create rpool/vm
zfs create rpool/backup
zfs create rpool/iso
```

Puis les ajouter dans Proxmox

---

# ⚡ Vérifier ton RAID ZFS

Pour être sûr :

```bash
zpool status
```

Tu devrais voir : `raidz1`

```text
  pool: rpool
 state: ONLINE
config:

	NAME                                                 STATE     READ WRITE CKSUM
	rpool                                                ONLINE       0     0     0
	  raidz1-0                                           ONLINE       0     0     0
	    nvme-eui.ace42e00416838d62ee4ac0000000001-part3  ONLINE       0     0     0
	    nvme-eui.ace42e0041683e772ee4ac0000000001-part3  ONLINE       0     0     0
	    nvme-eui.ace42e0041683e7a2ee4ac0000000001-part3  ONLINE       0     0     0

errors: No known data errors

```

---

# 🧠 Résumé

- ✔️ ton stockage est OK
- ✔️ ZFS fonctionne correctement
- ✔️ ~1.8 To = normal (3×1TB en RAIDZ1)
- ✔️ VM → `rpool/data`

