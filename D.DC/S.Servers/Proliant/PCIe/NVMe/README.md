# **ProLiant G7 (DL/DL260/DL360 génération G7)**, Quel NVMe? :

## ⚠️ 1. Compatibilité NVMe — limite majeure

* Les serveurs **G7 ≈ 2010–2012** → BIOS legacy (pas UEFI complet)
* Support officiel stockage :
  * ✅ SATA / SAS uniquement
  * ❌ **Pas de NVMe natif** [\[cloudninjas.com\]](https://cloudninjas.com/collections/hp-proliant-dl360-g7-ssd-upgrades)

👉 Concrètement :

* Le serveur peut **voir un NVMe via un adaptateur PCIe**
* MAIS :
  * ❌ **pas bootable nativement**
  * ⚠️ parfois détecté seulement comme stockage secondaire
  * ⚠️ dépend du BIOS/firmware [\[global.icydock.com\]](https://global.icydock.com/resources/icy_tips_1439.html)

***

## ⚠️ 2. NVMe via PCIe — ça marche comment ici

Tu dois passer par :

```
NVMe (M.2) → adaptateur PCIe → slot PCIe serveur
```

✅ Ça fonctionne généralement comme disque secondaire  
❌ Le boot = compliqué (loader USB ou mod BIOS)

👉 Sur vieux systèmes :

* NVMe possible **uniquement en stockage** ou avec hack (Clover EFI, etc.) [\[sabrent.com\]](https://sabrent.com/blogs/miscellaneous/adding-nvme-support-to-old-systems-motherboards)

***

## ✅ 3. Quel NVMe choisir (important)

Sur G7 → inutile de prendre un NVMe “haut de gamme”:

### 👉 Recommandations pratiques

* Interface : **PCIe Gen3 x4 NVMe**
* Format : **M.2 2280**
* Type : TLC (évite QLC cheap)

### 👉 Bons modèles (compatibles et stables)

* Samsung 970 EVO / 970 EVO Plus
* WD Blue SN570 / SN770
* Kingston NV2 (budget OK pour lab)
* Intel DC P4500 (enterprise si récup)

✅ Tous fonctionneront avec adaptateur  
⛔ tu ne verras PAS la différence Gen4 vs Gen3 (limité par PCIe 2.0 du G7)

***

## ✅ 4. Adaptateur PCIe — beaucoup plus critique que le SSD

Prends un adaptateur simple et passif :

### ✔️ modèles fiables

* Sabrent EC‑PCIe
* Glotrends PA09
* StarTech PCIe → NVMe

✅ PCIe x4/x8/x16 OK  
⚠️ pas PCIe x1 → trop lent / incompatible [\[graphicscardhub.com\]](https://graphicscardhub.com/m-2-pcie-adapter/)

***

## ⚠️ 5. Pièges importants (très fréquents en labo)

### ❌ 1. Boot NVMe

* G7 = BIOS → pas NVMe boot
* Solutions :
  * boot USB → Proxmox / ESXi → NVMe data
  * ou Clover bootloader

### ❌ 2. RAID HP (Smart Array)

* Ne voit PAS le NVMe
* NVMe bypass → direct PCIe seulement [\[experts-exchange.com\]](https://www.experts-exchange.com/articles/38756/Lessons-Learned-Adding-Used-NVME-Drive-to-HP-ProLiant-Server-with-ESXi.html)

### ❌ 3. Performance

* limité à PCIe 2.0 → \~1.5–2 GB/s max
* donc inutile de payer pour Gen4/Gen5

***

## ✅ 6. Recommandation finale (setup optimal lab étudiant)

Si ton but = Proxmox / lab :

### ✅ configuration idéale

* Boot :
  * USB interne HP ou SD card
* Storage :
  * NVMe via PCIe (VMs rapides)
* Bulk :
  * SAS/SATA pour stockage

***

## 🔧 Résumé rapide

```
G7 + NVMe = OK (via PCIe adapter)
Boot NVMe = NON (sans hack)
Adapter simple PCIe x4 = OBLIGATOIRE
NVMe Gen3 (pas cher) = suffisant
```
