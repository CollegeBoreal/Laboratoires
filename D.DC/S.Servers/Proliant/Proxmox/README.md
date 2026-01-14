# 💻 Proxmox VE Installation – HP ProLiant DL360 G6

## 🎯 Objectif
L’objectif de ce projet est de reconfigurer le serveur HP ProLiant DL360 G6 et d’installer **Proxmox VE** avec la configuration suivante :

- 🧠 **RAM** : 64 GB  
- 💾 **Stockage** : 272 GB en **RAID 5**



---

## 🧰 Phase 1 : Préparation des outils

### # Step 1 : Télécharger Proxmox 
- Aller sur le site officiel de **Proxmox VE**
- Télécharger le fichier **ISO**


### # Step 2 : Télécharger Rufus
- Aller sur le site officiel de **Rufus**
- Télécharger le logiciel
  
 | Logiciel       | Lien officiel                          |
 |----------------|----------------------------------------|
 | Proxmox VE ISO | [https://www.proxmox.com/en/](https://www.proxmox.com/en/) |
 | Rufus          | [https://rufus.ie/fr/](https://rufus.ie/fr/) |

### # Step 3 : Créer la clé USB bootable 🔑
- Insérer une clé USB
- Ouvrir **Rufus**
- Sélectionner l’image ISO de **Proxmox VE**
- Cliquer sur **Start**

<img src="images/img12.png" width="450" height="600" /> <img src="images/img14.png" width="450" height="600" />

📌 ## Attendre la fin de la création iso avant de retirer USB

<img src="images/img15.png" width="450" height="600" /> 

📌## Retirer la cle USB maintenant 

<img src="images/img16.png" width="450" height="600" />

---

## 🖥️ Phase 2 : Préparation du serveur
#🅰️ Retirer du serveur sur le rack

<img src="images/img21.png" width="450" height="600" />

### # Step 4 : Installation de la RAM 🧠
Installer les barrettes suivantes :
- 16 GB  
- 8 GB  
- 4 GB
- 
<img src="images/img18.png" width="450" height="600" /> <img src="images/img20.png" width="450" height="600" />


  <img src="images/img19.png" width="450" height="600" />

➡ Total : **64 GB**

---

### # Step 5 : Accès au contrôleur RAID 💽
- Démarrer le serveur
- Appuyer sur **F8** pour acceder ILO
- Sélectionner **Exit**
- 
<img src="images/img23.png" width="400" height="600" />

- Appuyer sur **OK**
  
<img src="images/img24.png" width="450" height="600" /> <img src="images/img25.png" width="450" height="600" />


- Appuyer de nouveau sur **F8**
- 
-D'abord supprimer logical drive existant

<img src="images/img28.png" width="450" height="600" /> <img src="images/img29.png" width="450" height="600" />

<img src="images/img30.png" width="450" height="600" /> <img src="images/img31.png" width="450" height="600" />

--- 

### # Step 6 : Configuration du RAID 5
- Apres avoir Supprimer les anciens volumes

- Créer un nouveau volume :
  - Type : **RAID 5**
  - Capacité : **272 GB**
<img src="images/img34.png" width="450" height="600" />
<img src="images/img35.png" width="450" height="600" />  

<img src="images/img36.png" width="450" height="600" /> <img src="images/img37.png" width="450" height="600" />

- Sauvegarder et quitter

---

## 🚀 Phase 3 : Démarrage sur la clé USB

### # Step 7 : Boot sur USB 🔌
- Redémarrer le serveur
- Appuyer sur **F11**
- Sélectionner la clé USB
- Choisir **Option 3**

---

## 📦 Phase 4 : Installation de Proxmox VE

### # Step 8 : Installation

<img src="images/img42.png" width="450" height="600" /> <img src="images/img44.png" width="450" height="600" />

<img src="images/img46.png" width="450" height="600" /> <img src="images/img48.png" width="450" height="600" />

- Sélectionner **Install Proxmox VE**
- Cliquer sur **Agree**
- Cliquer sur **Next**
- Choisir :
  - Pays
  - Région
- Cliquer sur **Next**
- Entrer :
  - Mot de passe
  - Email
- Cliquer sur **Next**
- Choisir le **Hostname**
- Cliquer sur **Next**
- Cliquer sur **Next** pour lancer l’installation

---

## 🔄 Phase 5 : Finalisation

### # Step 9 : Accès à Proxmox
- Une fois l’installation terminée, le serveur redémarre
- Appuyer sur **F1** pour continuer
- Une URL apparaît, par exemple :
- # https//10.7.237.33:8006/
- Se connecter avec :
- **Login** : root
- **Mot de passe** défini pendant l’installation

<img src="images/img58.png" width="450" height="600" /> <img src="images/img59.png" width="450" height="600" />







