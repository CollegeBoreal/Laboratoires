# 📦 WDS (Windows Deployment Services) — CHEAT SHEET

## 🧠 Définition

```
WDS = rôle Windows Server pour déployer Windows via le réseau (PXE)
```

👉 Pas de USB/DVD → tout passe par LAN [\[learn.microsoft.com\]](https://learn.microsoft.com/en-us/windows/win32/wds/windows-deployment-services-portal)

***

## ⚙️ Architecture rapide

```
[Client]
   ↓ PXE boot
[DHCP] → IP
   ↓
[WDS server]
   ↓ boot.wim (WinPE)
   ↓ install.wim
[Windows installé]
```

 [\[inferse.com\]](https://www.inferse.com/859264/how-to-deploy-windows-using-windows-deployment-services/)

***

## 🔑 Concepts clés

* **PXE** : boot réseau
* **WinPE** : environnement d’installation
* **boot.wim** : image de démarrage
* **install.wim** : image OS
* **Unattend.xml** : installation automatique

***

## ⚙️ Pré-requis

* Windows Server
* DHCP ✅
* DNS ✅
* (AD facultatif en mode standalone)
* Stockage NTFS pour images [\[learn.microsoft.com\]](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/hh831764%28v=ws.11%29)

***

## 🚀 Installation (PowerShell — 1 ligne)

```powershell
Install-WindowsFeature -Name WDS -IncludeManagementTools
```

 [\[rdr-it.com\]](https://rdr-it.com/wds-installation-et-configuration/)

***

## 🔧 Setup minimal (workflow)

```
1. Installer rôle WDS
2. Configure Server
3. Choisir dossier RemoteInstall
4. Configurer PXE (répondre aux clients)
5. Ajouter boot.wim
6. Ajouter install.wim
```

***

## 📥 Déploiement client

```
1. Boot PC → PXE
2. IP via DHCP
3. Chargement WinPE
4. Choix image
5. Installation automatique
```

 [\[inferse.com\]](https://www.inferse.com/859264/how-to-deploy-windows-using-windows-deployment-services/)

***

## 🧪 Commandes utiles

```powershell
Get-WindowsFeature *WDS*

wdsutil /get-server /show:config
```

***

## 🎯 Cas d’usage

* Labs étudiants (30+ machines)
* Réinstallation rapide
* Standardisation images
* Classroom / cégep / entreprise

***

## ⚠️ WDS vs MDT (TRÈS IMPORTANT)

```
WDS → déploie uniquement
MDT → crée + personnalise les images
```

 [\[smartdeploy.com\]](https://www.smartdeploy.com/blog/what-is-windows-deployment-services/)

✅ Souvent utilisés ensemble

***

## 💡 Tips prof / lab

* Mettre WDS + DHCP sur même VM (plus simple en lab)
* Toujours tester PXE en BIOS + UEFI
* Créer snapshot après config
* Préparer une image "golden" propre

***

## 🚫 Limitations

* Pas de création d’image avancée
* Outil partiellement vieillissant
* Supplanté par Autopilot / SCCM dans le cloud [\[smartdeploy.com\]](https://www.smartdeploy.com/blog/what-is-windows-deployment-services/)

***

✅ **Résumé en 1 ligne**

```
WDS = PXE + WinPE + deploy image Windows en masse
```
