# Sessions


## H26

| Etiquette | Host IP | RAM (GB) | CPU | DD (GB) | Edition Système d'Exploitation | Check |
|-|-|-|-|-|-|-|
| S13 | https://10.7.237.16:8006 | 64 | 16 | 272 | Proxmox VE | ✔️ |
| S17 | https://10.7.237.28:8006 | 64 | 16 | 272 | Proxmox VE | ✔️ |
| S18 | https://10.7.237.33:8006 | 64 | 16 | 272 | Proxmox VE | ✔️ |
| S21 | https://10.7.236.19:8006 | 64 | 16 | 272 | Proxmox VE | ✔️ |
| S25 | https://10.7.237.38:8006 | 64 | 16 | 272 | Proxmox VE | ✔️ |
| S37 | https://10.7.237.10:8006 | 64 | 16 | 272 | Proxmox VE | ✔️ |


```python
root@labinfo:~# ip addr | grep vmbr0
2: enp2s0f0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq master vmbr0 state UP group default qlen 1000
4: vmbr0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    inet 10.7.237.10/23 brd 10.7.237.255 scope global vmbr0
root@labinfo:~# lsmem
RANGE                                  SIZE  STATE REMOVABLE BLOCK
0x0000000000000000-0x00000000dfffffff  3.5G online       yes  0-27
0x0000000100000000-0x000000031fffffff  8.5G online       yes 32-99

Memory block size:       128M
Total online memory:      12G
Total offline memory:      0B
```
