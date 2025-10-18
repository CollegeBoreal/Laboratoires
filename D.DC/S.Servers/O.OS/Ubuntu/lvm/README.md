# :roll_of_paper: **LV has free space in the VG**

**LV has free space in the VG**, your root filesystem is still showing **98 GiB**. That means **the logical volume was not yet expanded**, or the filesystem wasn’t resized.

Here’s the step-by-step fix:

---

## 1️⃣ Expand the logical volume

```bash
sudo lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
```

* This will expand your LV from 100 GiB → ~271 GiB (using all free space).
* After this, check LV size:

```bash
sudo lvdisplay /dev/ubuntu-vg/ubuntu-lv
```

You should see **LV Size: 271 GiB**.

---

## 2️⃣ Resize the filesystem

Since your root filesystem is **ext4**, run:

```bash
sudo resize2fs /dev/ubuntu-vg/ubuntu-lv
```

* This grows the filesystem to match the new LV size.
* No reboot needed — ext4 can resize while mounted.

---

## 3️⃣ Verify

```bash
df -h /
```

You should now see:

```
Filesystem                        Size  Used Avail Use% Mounted on
/dev/mapper/ubuntu--vg-ubuntu--lv 271G  16G   255G  6% /
```

---

💡 **Summary**

1. Expand LV → `lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv`
2. Resize FS → `resize2fs /dev/ubuntu-vg/ubuntu-lv`
3. Verify → `df -h /`
