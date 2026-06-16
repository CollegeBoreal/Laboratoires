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

## 🗄️ Rack 1️⃣ - 📇 45U

| Rack | U#️⃣| 🏙️ Serveurs | 🏷️ | Host IP                | RAM  | CPU | HD      | Operating Systems | Services                                                 |
| ---- | -:| ------------| -- | ---------------------- | ---: | ---:| ------- | ----------- | -------------------------------------------------------- |
| 1️⃣   |    |
| 1️⃣   | 44 | Fibre      |    |                        |      |      |     |  COMSCOPE EPX              | Accès Fibre BELL |
| 1️⃣   | 43 | [CISCO Catalist 9200 48 PoE+](https://www.cisco.com/c/en/us/products/collateral/switches/catalyst-9200-series-switches/nb-06-cat9200-ser-data-sheet-cte-en.html)     |    | 10.7.48.4              |      |      |     |                | VLAN 237 10.7.236.0/23 |
| 1️⃣   | 42 | [KCONN Angled PP 24 1U](https://www.belden.com/products/panels-patching-systems/rj45-patch-panels/rack-mount-panel/kconn-angled-pp-24-1u)
| 1️⃣   | 41 | BELDEN 24
| 1️⃣   | 40 | BELDEN 24
| 1️⃣   |    |
| 1️⃣   | 37 | Switch     |    |              |      |      |     |  CISCO Catalist 3560 48 PoE              | |

| Rack | U#️⃣| 🏙️ Serveurs | 🏷️ | S/N #️⃣     | Host IP                | RAM  | CPU | HD      | Operating Systems | Services                                                 |
| ---- | -:| ------------| -- | ---------  | ---------------------- | ---: | ---:| ------- | ----------- | -------------------------------------------------------- |
| 1️⃣   | 33 | 🅰️ G6️⃣      | S08| USE110N1MZ | 10.7.237.18            | 8GB  | 16  | 273.4GB |
| 1️⃣   | 32 | 🅰️ G7️⃣      | S04| MXQ1200F5B | 10.7.237.3             | 64GB | 16  | 546GB   | 🪟 2022 DC  | DC, DHCP, WDS, VM Linux (Nginx+Python), VM Linux (MySQL) |
| 1️⃣   | 31 | 🅰️ G7️⃣      | S05|            | 10.7.237.48            | 64GB | 8   | 273.4GB | 🪟 2022 DC  | PaaS programmation systèmes        |
| 1️⃣   | 30 | 🅰️ G6️⃣      | S09| MXQ0070413 | 10.7.237.131           | 56GB | 16  | 273.4GB 🚨 $\color{red}RAM-P2(4,5,6)$ | 🪟 2022 DC  | PaaS programmation systèmes          |
| 1️⃣   | 29 | 🅰️ G7️⃣      | S07| USE107NACM | 10.7.237.37            | 64GB | 16  | 273.4GB | 🪟 2022 DC  | PaaS programmation systèmes        |
| 1️⃣   |    |
| 1️⃣   | 27 | 🅱️          |TBD| 7FXTY84 | 10.7.236.6–10.7.236.11  | 1TB  | 32  | 13.9TB  | 🪟 2022 DC  | VM, Domain Controller, DHCP INFRA002  |
| 1️⃣   | 26 | 🅱️          |TBD| 8FXTY84 | 10.7.236.13–10.7.236.17 | 1TB  | 32  | 13.9TB  | 🪟 2022 DC  | VM, Domain Controller INFRA003        |
| 1️⃣   | 25 | 🅱️          |TBD| 9KDZ6D4 | 10.7.237.60             | 1TB  | 32  | 13.9TB  | 🪟 2022 DC  | VM, Domain Controller INFRA001        |

## 🗄️ Rack 2️⃣ - 📇 45U

| Rack | U#️⃣| 🏙️ Serveurs | 🏷️  | S/N #️⃣ | Host IP                      | RAM  | CPU | HD      | Operating Systems      | Services                           |
| ---- | -:| ------------| --- | - | ------------------------------------ | ---: | ---:| ------- | ---------------------- | ---------------------------------- |
| 2️⃣   |    |
| 1️⃣   | 44 | Switch     |     |    |         10.7.48.5                             |      |     |         | CISCO Catalyst 9200 48 PoE+ 
| 2️⃣   |    |
| 2️⃣   | 41 | 🅰️ G6️⃣      |     | USE928N320 |                                         |  0GB | ?? |          | 🚨 $\color{red}\text{NO BOOT}$             | :x:
| 2️⃣   | 40 | 🅰️ G6️⃣      | S18 | MXQ9410AFZ | 10.7.237.22                             | 64GB | 16  | 273.4G  | 🚨 $\color{red}\text{CPU-P2 DEAD NO BOOT}$ | :x:
| 2️⃣   |    |
| 2️⃣   | 34 | 🅰️ G6️⃣      | S27 | USE928N320⚠️ | 10.7.237.34 | 64GB | 16  | 273.4G  | ⚠️ A installer 🚨 $\color{red}RAM-P2(6,9)$ [1] | [INF1092-201-E26-01 🥇]
| 2️⃣   | 33 | 🅰️ G6️⃣      | S19 | MXQ00309PP✅ | 10.7.237.7 | 64GB | 16  | 273.4G  | 🪟 2022 DC $\color{blue}\text{1TBNVMe}$ | [INF1092-201-E26-01 🥇]
| 2️⃣   | 32 | 🅰️ G6️⃣      | S37 | MXQ01105H4❌ | 10.7.237.13 | 64GB | 16  | 273.4G  | ❌
| 2️⃣   | 31 | 🅰️ G6️⃣      | S39 | USE025N7B5⚠️ | 10.7.237.35 | 64GB | 16  | 273.4G  | 🪟 2022 DC 🚨 $\color{red}RAM-P2(1)$ [1] | [INF1092-201-E26-01 🥇]
| 2️⃣   |    |
| 2️⃣   | 27 | 🅰️ G6️⃣      | S21 | MXQ0390BMX❌ | 10.7.237.19 | 64GB | 16  | 273.4G  | ❌
| 2️⃣   | 26 | 🅰️ G6️⃣      | S25 | MXQ016001V✅ | 10.7.237.24 | 64GB | 16  | 273.4G  | 🪟 2022 DC | [INF1092-201-E26-01 🥇]
| 2️⃣   | 25 | 🅰️ G6️⃣      | S17 | MXQ02302FC⚠️ | 10.7.237.28 | 32GB ⚠️ | 16  | 273.4G  | 🪟 2022 DC 🚨 $\color{red}RAM-P2(3,6)$ | [INF1092-201-E26-01 🥇]
| 2️⃣   | 24 | 🅰️ G6️⃣      | S13 | MXQ0030BLP✅ | [10.7.237.16](https://10.7.237.16:8006) | 64GB | 16  | 273.4G  | ⚠️ A installer  | 
| 2️⃣   |    |
| 2️⃣   | 10 | 🅰️ G7️⃣      | S28 |  | 10.7.237.11                             | 64GB | 16  | 273.4G  |
| 2️⃣   |  9 | 🅰️ G7️⃣      | S35 |  | [10.7.237.5](https://10.7.237.5:8006)   | 64GB | 16  | 273.4G $\color{green}\text{1TBNVMe}$ | 🏵️ PVE 7.4
| 2️⃣   |  8 | 🅰️ G7️⃣      | S26 |  | 10.7.237.40                             | 48GB | 16  | 273.4G  |
| 2️⃣   |  7 | 🅰️ G7️⃣      | S20 |  | 10.7.237.x                              | 64GB | 16  | 273.4G  |
| 2️⃣   |    |

---

# References

[INF1092-201-E26-01 🥇]: https://github.com/CollegeBoreal/INF1092-201-E26-01
[1]: https://community.hpe.com/t5/hpe-proliant-servers-ml-dl-sl/ram-error-on-proliant-dl360-g6/td-p/4596820

### Observations rapides

* **3 serveurs récents très puissants** : DELL R660 (1 TB RAM chacun).
* Beaucoup de **HP DL360 G6/G7 (anciens)** → bon pour lab / PaaS étudiant.
* Plusieurs serveurs **sans OS documenté**.
* Plusieurs **services critiques sur un seul serveur (S04)** :

  * DC
  * DHCP
  * WDS
  * VMs
