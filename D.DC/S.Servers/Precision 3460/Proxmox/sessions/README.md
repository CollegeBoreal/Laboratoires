# Sessions


## H26

| Cab | U | 🏷️ | Host IP | RAM | CPU | 🧻 (GB) | Proxmox | Check | Classes |
|-|-|-|-|-|-|-|-|-|-|
| :one: | 👜 |  | [10.7.237.25](https://10.7.237.25:8006) | 32 | 28 | 1.8T | VE 9.1.1 | ⤴️ |  |


```bash
ip link show  vmbr0
```
```lua
3: vmbr0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default qlen 1000
    link/ether b4:e9:b8:3b:06:63 brd ff:ff:ff:ff:ff:ff
```

```powershell
Get-DhcpServerv4Scope
```
```

ScopeId         SubnetMask      Name           State    StartRange      EndRange        LeaseDuration
-------         ----------      ----           -----    ----------      --------        -------------
10.7.236.0      255.255.254.0   237/23         Active   10.7.236.1      10.7.237.254    00:15:00
```

Your DHCP scope is `10.7.236.0` with a `/23` subnet mask (`255.255.254.0`), and the IP address `10.7.237.15` falls within the range (`10.7.236.1` – `10.7.237.254`).

### ✅ Correct PowerShell Command (run on server S14)

```powershell
Add-DhcpServerv4Reservation -ScopeId 10.7.236.0 -IPAddress 10.7.237.15 -ClientId "b4-e9-b8-3b-06-63" -Name "Proxmox-ve-9-Precision3460"
```

No need to specify `-ComputerName` since you’re already on S14.

### 🔍 Verify the Reservation

```powershell
Get-DhcpServerv4Reservation -ScopeId 10.7.236.0 | Where-Object IPAddress -eq 10.7.237.15
```

Or view all reservations in that scope:

```powershell
Get-DhcpServerv4Reservation -ScopeId 10.7.236.0
```

---

### 📝 Important Notes

- The reservation will be created as long as the IP address is **not already leased or excluded** in the scope.
- If the Proxmox host already has a lease for a different IP, you may need to **release/renew** the IP on the client side after creating the reservation. On Proxmox, you can run `dhclient -r vmbr0 && dhclient vmbr0` to force a new lease.

