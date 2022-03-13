# IPMI


- [ ] [Ubuntu Linux Server - Configuration Required for IPMITOOL Management Utility to Function on any HP ProLiant Server With an Integrated Lights-Out 2 (iLO 2) and Running Ubuntu Linux 9.04 Server](https://support.hpe.com/hpesc/public/docDisplay?docId=emr_na-c01930307)

DESCRIPTION

On an HP ProLiant server with an Integrated Lights-Out 2 (iLO 2) and running Ubuntu Linux Server, the Linux IPMI management utility, IPMITOOL, does not function. For example, when typing the following command:

```
$ipmitool mc info
```

The following will be displayed:

```
Could not open device at /dev/ipmi0 or /dev/ipmi/0 or /dev/ipmidev/0:
No such file or directory
Get Device ID command failed
````
