# Servers

## :cityscape: Types Serveurs

| Symbol | Make | Brand | Series |
|-|-|-|-|
| 🅰️ | HP   | Proliant DL360 |  G6️⃣ and G7️⃣ |
| 🅱️ | DELL | PowerEdge R660 | |
| ⭕ | DELL | Precision 3460 |

## 🌰 Types OSs

| Symbol | OS | Version |
|-|-|-|
| 🪟 | Windows Server | 2022 DC (Datacenter) |
| 🐧 | Linux Server   | 2024 Ubuntu |
| 🏵️ | Proxmox        | PVE 9 |

## 🗄️ Rack 1️⃣ - 📇 42U

| Rack | U#️⃣| 🏙️ Serveurs | 🏷️ | Host IP                | RAM  | CPU | HD      | Operating Systems | Services                                                 |
| ---- | -:| ------------| -- | ---------------------- | ---: | ---:| ------- | ----------- | -------------------------------------------------------- |
| 1️⃣   | 42 | Fibre      |    |                        |      |      |     |                | Accès Fibre BELL |
| 1️⃣   | 41 | Switch     |    |                        |      |      |     |                | VLAN 237 10.7.236.0/23 |
| 1️⃣   |    |
| 1️⃣   | 32 | 🅰️ G7️⃣      | S04| 10.7.237.3             | 64GB | 16  | 546GB   | 🪟 2022 DC  | DC, DHCP, WDS, VM Linux (Nginx+Python), VM Linux (MySQL) |
| 1️⃣   | 31 | 🅰️ G7️⃣      | S05| 10.7.237.48            | 64GB | 8   | 273.4GB | 🪟 2022 DC  | PaaS programmation systèmes        |
| 1️⃣   | 27 | 🅰️ G7️⃣      | S07| 10.7.237.37            | 64GB | 16  | 273.4GB | 🪟 2022 DC  | PaaS programmation systèmes        |
| 1️⃣   | 28 | 🅰️ G6️⃣      | S08| 10.7.237.18            | 8GB  | 16  | 273.4GB |
| 1️⃣   | 27 | 🅰️ G6️⃣      | S09| 10.7.237.42            | 56GB | 16  | 273.4GB |             | PaaS programmation systèmes          |
| 1️⃣   | 27 | 🅱️          |TBD| 10.7.236.6–10.7.236.11  | 1TB  | 32  | 13.9TB  | 🪟 2022 DC  | VM, Domain Controller, DHCP INFRA002  |
| 1️⃣   | 26 | 🅱️          |TBD| 10.7.236.13–10.7.236.17 | 1TB  | 32  | 13.9TB  | 🪟 2022 DC  | VM, Domain Controller INFRA003        |
| 1️⃣   | 25 | 🅱️          |TBD| 10.7.237.60             | 1TB  | 32  | 13.9TB  | 🪟 2022 DC  | VM, Domain Controller INFRA001        |

## 🗄️ Rack 2️⃣ - 📇 42U

| Rack | U#️⃣| 🏙️ Serveurs | 🏷️  | Host IP                                 | RAM  | CPU | HD      | OS                     | Services                           |
| ---- | -:| ------------| --- | --------------------------------------- | ---: | ---:| ------- | ---------------------- | ---------------------------------- |
| 1️⃣   | 42 | Switch     |     |                                         |      |     |         | CISCO
| 2️⃣   |    |
| 2️⃣   | 40 | 🅰️ G6️⃣      | S13 | 10.7.237.16                             | 56GB | 16  | 273.4G  |
| 2️⃣   |    |
| 2️⃣   | 34 | 🅰️ G6️⃣      | S18 | 10.7.237.22                             | 28GB | 16  | 273.4G  | 🪟 2022 DC
| 2️⃣   | 33 | 🅰️ G6️⃣      | S19 | 10.7.237.7                              | 16GB | 16  | 273.4G  | 🪟 2022 DC
| 2️⃣   | 32 | 🅰️ G6️⃣      | S37 | 10.7.237.13                             | 64GB | 16  | 273.4G  | 🪟 2022 DC
| 2️⃣   | 31 | 🅰️ G6️⃣      | S39 | 10.7.237.35                             | 28GB | 16  | 273.4G  | 🪟 2022 DC                           
| 2️⃣   |    |
| 2️⃣   | 28 | 🅰️ G6️⃣      | S21 | 10.7.237.19                             | 36GB | 16  | 273.4G  | 🪟 2022 DC
| 2️⃣   | 27 | 🅰️ G6️⃣      | S25 | 10.7.237.24                             | 56GB | 16  | 273.4G  | 🪟 2022 DC
| 2️⃣   | 25 | 🅰️ G6️⃣      | S17 | 10.7.237.28                             | 48GB | 16  | 273.4G  | 🪟 2022 DC
| 2️⃣   | 26 | 🅰️ G6️⃣      | S27 | 10.7.237.34                             | 44GB | 16  | 273.4G  | 🪟 2022 DC
| 2️⃣   |    |
| 2️⃣   | 12 | 🅰️ G6️⃣      | S28 | 10.7.237.11                             | 64GB | 16  | 273.4G  |
| 2️⃣   | 10 | 🅰️ G6️⃣      | S35 | [10.7.237.5](https://10.7.237.5:8006)   | 64GB | 16  | 273.4G  | 🏵️ PVE 7.4
| 2️⃣   |  9 | 🅰️ G6️⃣      | S26 | 10.7.237.40                             | 48GB | 16  | 273.4G  |
| 2️⃣   |    |
| 2️⃣   |  8 | 🅰️ G6️⃣      | S20 | 10.7.237.x                              | 64GB | 16  | 273.4G  |

---

### Observations rapides

* **3 serveurs récents très puissants** : DELL R660 (1 TB RAM chacun).
* Beaucoup de **HP DL360 G6/G7 (anciens)** → bon pour lab / PaaS étudiant.
* Plusieurs serveurs **sans OS documenté**.
* Plusieurs **services critiques sur un seul serveur (S04)** :

  * DC
  * DHCP
  * WDS
  * VMs
