# PCI Passthrough


Parfait. Tu utilises :

```text
UEFI + GRUB
```

et non `systemd-boot`.

La bonne nouvelle est que **l'IOMMU fonctionne déjà** (on l'a confirmé avec `dmesg`), donc tu n'es pas bloqué par le BIOS ni par VT-d.

### État actuel

| Composant          | État         |
| ------------------ | ------------ |
| Intel UHD 770      | ✅            |
| NVIDIA RTX A400    | ✅            |
| IOMMU              | ✅            |
| Groupe IOMMU dédié | ✅ Groupe 12  |
| VFIO               | ❌ pas chargé |
| nouveau            | ✅ actif      |
| Passthrough prêt   | Presque      |

### Configuration recommandée pour PCI Passthrough

Créer :

```bash
cat >/etc/modules-load.d/vfio.conf <<EOF
vfio
vfio_pci
vfio_iommu_type1
EOF
```

Créer :

```bash
cat >/etc/modprobe.d/vfio.conf <<EOF
options vfio-pci ids=10de:25b2,10de:2291
EOF
```

Bloquer Nouveau :

```bash
cat >/etc/modprobe.d/blacklist-nouveau.conf <<EOF
blacklist nouveau
options nouveau modeset=0
EOF
```

Reconstruire l'initramfs :

```bash
update-initramfs -u -k all
```
<details>

```lua

update-initramfs: Generating /boot/initrd.img-6.17.2-1-pve
Running hook script 'zz-proxmox-boot'..
Re-executing '/etc/kernel/postinst.d/zz-proxmox-boot' in new private mount namespace..
Copying and configuring kernels on /dev/disk/by-uuid/E2B8-705F
	Copying kernel 6.17.2-1-pve
Generating grub configuration file ...
Found linux image: /boot/vmlinuz-6.17.2-1-pve
Found initrd image: /boot/initrd.img-6.17.2-1-pve
Adding boot menu entry for UEFI Firmware Settings ...
done
Copying and configuring kernels on /dev/disk/by-uuid/E2B8-B79F
	Copying kernel 6.17.2-1-pve
Generating grub configuration file ...
Found linux image: /boot/vmlinuz-6.17.2-1-pve
Found initrd image: /boot/initrd.img-6.17.2-1-pve
Adding boot menu entry for UEFI Firmware Settings ...
done
Copying and configuring kernels on /dev/disk/by-uuid/E2B8-E56D
	Copying kernel 6.17.2-1-pve
Generating grub configuration file ...
Found linux image: /boot/vmlinuz-6.17.2-1-pve
Found initrd image: /boot/initrd.img-6.17.2-1-pve
Adding boot menu entry for UEFI Firmware Settings ...
done
```
  
</details>

Redémarrer :

```bash
reboot
```

***

### Après le redémarrage

Vérifier :

```bash
lspci -nnk -s 01:00.0
```
<details>

```lua
0000:01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GA107GL [RTX A400] [10de:25b2] (rev a1)
	Subsystem: Dell Device [1028:1879]
	Kernel driver in use: vfio-pci
	Kernel modules: nvidiafb, nouveau
```
	
</details>

Résultat attendu :

```text
Kernel driver in use: vfio-pci
```

et non plus :

```text
Kernel driver in use: nouveau
```

### Ajouter le GPU à la VM 100

```bash
qm set 100 -hostpci0 01:00,pcie=1
```

Vérification :

```bash
qm config 100
```

devrait contenir quelque chose comme :

```text
hostpci0: 0000:01:00,pcie=1
```

***

### Si ton objectif est Ollama / CUDA dans Ubuntu

Après avoir démarré la VM :

```bash
lspci | grep -i nvidia
```

Puis dans Ubuntu :

```bash
ubuntu-drivers autoinstall
sudo reboot
```

et finalement :

```bash
nvidia-smi
```

Tu devrais voir la **RTX A400 (4 Go)** directement dans la VM.

### Vérification bonus

Avant toute modification, regarde si Proxmox a déjà détecté le GPU comme périphérique PCI utilisable :

```bash
pvesh get /nodes/$(hostname)/hardware/pci --pci-class-blacklist ""
```

Tu devrais y voir les entrées :

```text
01:00.0 NVIDIA RTX A400
01:00.1 NVIDIA HD Audio
```

Ce que je vois présentement, c'est une configuration quasiment idéale pour du passthrough GPU : UHD 770 pour l'hôte et RTX A400 dédiée à ta VM Ubuntu INF1092 ou à des tests IA.


