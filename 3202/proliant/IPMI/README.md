# IPMI


- [ ] [Ubuntu Linux Server - Configuration Required for IPMITOOL Management Utility to Function on any HP ProLiant Server With an Integrated Lights-Out 2 (iLO 2) and Running Ubuntu Linux 9.04 Server](https://support.hpe.com/hpesc/public/docDisplay?docId=emr_na-c01930307)

DESCRIPTION

On an HP ProLiant server with an Integrated Lights-Out 2 (iLO 2) and running Ubuntu Linux Server, the Linux IPMI management utility, IPMITOOL, does not function. For example, when typing the following command:

```
sudo ipmitool mc info
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

Verifiy that the following devices exist: /dev/ipmi0 or /dev/ipmi1

```
ls -l /dev/ipmi*
```
> Return
```
crw------- 1 root root 240, 0 Nov 24 03:52 /dev/ipmi0
```

 - [ ] To See Only the Temperature, Voltage, and Fan Sensors - SDR (Sensor Data Record)

```
sudo ipmitool sdr elist full
```
> Return
```
VRM 1            | 01h | ok  |  9.1 | Device Present
VRM 2            | 02h | ok  |  9.2 | Device Present
UID Light        | 03h | ok  | 23.1 |
Int. Health LED  | 04h | ok  | 23.2 |
Ext. Health LED  | 05h | ok  | 23.3 |
Power Supply 1   | 06h | ok  | 10.1 | 0 Watts, Presence detected, Failure detected
Power Supply 2   | 07h | ok  | 10.2 | 95 Watts, Presence detected
Power Supplies   | 08h | ok  | 10.3 | Non-Redundant: Sufficient from Redundant
Fan Block 1      | 09h | ok  |  7.1 | 21.56 percent, Transition to Running
Fan Block 2      | 0Ah | ok  |  7.2 | 21.56 percent, Transition to Running
Fan Block 3      | 0Bh | ok  |  7.3 | 21.56 percent, Transition to Running
Fan Block 4      | 0Ch | ok  |  7.4 | 21.56 percent, Transition to Running
Fans             | 0Dh | ok  |  7.5 | 0 percent, Fully Redundant
Temp 1           | 0Eh | ok  | 64.1 | 20 degrees C
Temp 2           | 0Fh | ok  | 65.1 | 40 degrees C
Temp 3           | 10h | ok  | 65.2 | 40 degrees C
Temp 4           | 11h | ns  |  8.1 | Disabled
Temp 5           | 12h | ok  |  8.2 | 36 degrees C
Temp 6           | 13h | ok  |  8.3 | 33 degrees C
Temp 7           | 14h | ok  |  8.4 | 34 degrees C
Temp 8           | 15h | ok  |  8.5 | 33 degrees C
Temp 9           | 16h | ok  |  8.6 | 32 degrees C
Temp 10          | 17h | ok  |  8.7 | 32 degrees C
Temp 11          | 18h | ok  |  8.8 | 32 degrees C
Temp 12          | 19h | ok  | 10.4 | 32 degrees C
Temp 13          | 1Ah | ok  | 10.5 | 49 degrees C
Temp 14          | 1Bh | ok  |  8.9 | 31 degrees C
Temp 15          | 1Ch | ok  | 65.3 | 33 degrees C
Temp 16          | 1Dh | ok  | 65.4 | 29 degrees C
Temp 17          | 1Eh | ok  |  8.10 | 30 degrees C
Temp 18          | 1Fh | ok  | 65.5 | 40 degrees C
Temp 19          | 20h | ok  |  5.1 | 37 degrees C
Temp 20          | 21h | ok  |  5.2 | 40 degrees C
Temp 21          | 22h | ok  |  5.3 | 48 degrees C
Temp 22          | 23h | ok  |  5.4 | 50 degrees C
Temp 23          | 24h | ok  |  5.5 | 43 degrees C
Temp 24          | 25h | ok  |  5.6 | 50 degrees C
Temp 25          | 26h | ok  |  5.7 | 37 degrees C
Temp 26          | 27h | ok  |  5.8 | 48 degrees C
Temp 27          | 28h | ok  | 15.1 | 35 degrees C
Temp 28          | 29h | ok  | 66.1 | 73 degrees C
Power Meter      | 2Ah | ok  |  7.6 | 100 Watts, Device Enabled
Memory           | 2Bh | ok  |  7.7 | Correctable ECC, Correctable ECC logging limit reached, Presence Detected
```

- [ ] To See All SDR Entities

```
sudo ipmitool sdr entity
```
> Return
```
Entity IDs:

     0  Unspecified                            1  Other
     2  Unknown                                3  Processor
     4  Disk or Disk Bay                       5  Peripheral Bay
     6  System Management Module               7  System Board
     8  Memory Module                          9  Processor Module
    10  Power Supply                          11  Add-in Card
    12  Front Panel Board                     13  Back Panel Board
    14  Power System Board                    15  Drive Backplane
    16  System Internal Expansion Board       17  Other System Board
    18  Processor Board                       19  Power Unit
    20  Power Module                          21  Power Management
    22  Chassis Back Panel Board              23  System Chassis
    24  Sub-Chassis                           25  Other Chassis Board
    26  Disk Drive Bay                        27  Peripheral Bay
    28  Device Bay                            29  Fan Device
    30  Cooling Unit                          31  Cable/Interconnect
    32  Memory Device                         33  System Management Software
    34  BIOS                                  35  Operating System
    36  System Bus                            37  Group
    38  Remote Management Device              39  External Environment
    40  Battery                               41  Processing Blade
    42  Connectivity Switch                   43  Processor/Memory Module
    44  I/O Module                            45  Processor/IO Module
    46  Management Controller Firmware        47  IPMI Channel
    48  PCI Bus                               49  PCI Express Bus
    50  SCSI Bus (parallel)                   51  SATA/SAS Bus
    52  Processor/Front-Side Bus              53  Real Time Clock(RTC)
    54  Reserved                              55  Air Inlet
    56  Reserved                              57  Reserved
    58  Reserved                              59  Reserved
    60  Reserved                              61  Reserved
    62  Reserved                              63  Reserved
    64  Air Inlet                             65  Processor
    66  Baseboard/Main System Board          160  PICMG Front Board
   192  PICMG Rear Transition Module         193  PICMG AdvancedMC Module
   240  PICMG Shelf Management Controller     241  PICMG Filtration Unit
   242  PICMG Shelf FRU Information          243  PICMG Alarm Panel
```

- [ ] To See All Fan-Related Sensors

```
sudo ipmitool sdr entity 29
```

- [ ] To See All SEL (System Event Log)

```
sudo ipmitool sel list
```
> Return
```
   0 | 06/29/2021 | 08:18:06 | Memory #0x2b | Correctable ECC logging limit reached | Asserted
   1 | 11/03/2021 | 15:01:48 | Memory #0x2b | Correctable ECC logging limit reached | Asserted
```

- [ ] :x: Error

The following will be displayed:

```
Could not open device at /dev/ipmi0 or /dev/ipmi/0 or /dev/ipmidev/0:
No such file or directory
Get Device ID command failed
````

# References

- [ ] [Using IPMItool to View System Information](https://docs.oracle.com/cd/E19464-01/820-6850-11/IPMItool.html)
- [ ] [IPMI Basics](https://www.thomas-krenn.com/en/wiki/IPMI_Basics)
