# IPMI


- [ ] [Ubuntu Linux Server - Configuration Required for IPMITOOL Management Utility to Function on any HP ProLiant Server With an Integrated Lights-Out 2 (iLO 2) and Running Ubuntu Linux 9.04 Server](https://support.hpe.com/hpesc/public/docDisplay?docId=emr_na-c01930307)

DESCRIPTION

On an HP ProLiant server with an Integrated Lights-Out 2 (iLO 2) and running Ubuntu Linux Server, the Linux IPMI management utility, IPMITOOL, does not function. For example, when typing the following command:

```
ipmitool mc info
```
> Return
```
Device ID                 : 19
Device Revision           : 1
Firmware Revision         : 1.28
IPMI Version              : 2.0
Manufacturer ID           : 11
Manufacturer Name         : Hewlett-Packard
Product ID                : 8192 (0x2000)
Product Name              : Unknown (0x2000)
Device Available          : yes
Provides Device SDRs      : yes
Additional Device Support :
    Sensor Device
    SDR Repository Device
    SEL Device
    FRU Inventory Device
```

- [ ] :x: Error

The following will be displayed:

```
Could not open device at /dev/ipmi0 or /dev/ipmi/0 or /dev/ipmidev/0:
No such file or directory
Get Device ID command failed
````
