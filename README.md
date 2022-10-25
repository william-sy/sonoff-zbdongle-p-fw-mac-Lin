# Sonoff USB Zigbee 3.0 firmware flasher:

This does not check firmware, it just flashes, so if you already have the lastest version it ill just overwrite it!

This script is a combination of all the software to make the process a bit easier, use at own risk!

## Firmware location:
https://github.com/Koenkk/Z-Stack-firmware/tree/master/coordinator/Z-Stack_3.x.0/bin

## Flashing documentation:
https://sonoff.tech/wp-content/uploads/2022/08/SONOFF-Zigbee-3.0-USB-dongle-plus-firmware-flashing-.pdf

## Firmware flasher:
https://github.com/JelmerT/cc2538-bsl


## Upgrading firmware:
To run the firmware upgrade:
`bash ./setup.sh`

To reset your working env. just in case:
`bash ./reset.sh`

## requirements
- python3
- pip
- Pip packages (installed for you)
- wget
- unzip
- git


## Example output:
```bash
❯ bash ./setup.sh
# Found python3!
# This command uses root, this is not best practice, but easy on the end user for connecting to serial
WARNING: The directory '/Users/test/Library/Caches/pip' or its parent directory is not owned or is not writable by the current user. The cache has been disabled. Check the permissions and owner of that directory. If executing pip with sudo, you should use sudo's -H flag.
Requirement already satisfied: wheel in /usr/local/lib/python3.10/site-packages (0.37.1)
Requirement already satisfied: pyserial in /usr/local/lib/python3.10/site-packages (3.5)
Requirement already satisfied: intelhex in /usr/local/lib/python3.10/site-packages (2.3.0)
Requirement already satisfied: python-magic in /usr/local/lib/python3.10/site-packages (0.4.27)
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv

[notice] A new release of pip available: 22.2.2 -> 22.3
[notice] To update, run: python3.10 -m pip install --upgrade pip
WARNING: The directory '/Users/test/Library/Caches/pip' or its parent directory is not owned or is not writable by the current user. The cache has been disabled. Check the permissions and owner of that directory. If executing pip with sudo, you should use sudo's -H flag.
ERROR: Could not find a version that satisfies the requirement zipy-znp (from versions: none)
ERROR: No matching distribution found for zipy-znp

[notice] A new release of pip available: 22.2.2 -> 22.3
[notice] To update, run: python3.10 -m pip install --upgrade pip
# This will take a while :(.
WARNING: The directory '/Users/test/Library/Caches/pip' or its parent directory is not owned or is not writable by the current user. The cache has been disabled. Check the permissions and owner of that directory. If executing pip with sudo, you should use sudo's -H flag.
Requirement already satisfied: gevent in /usr/local/lib/python3.10/site-packages (22.10.1)
Requirement already satisfied: greenlet<2.0,>=1.1.3 in /usr/local/lib/python3.10/site-packages (from gevent) (1.1.3.post0)
Requirement already satisfied: setuptools in /usr/local/lib/python3.10/site-packages (from gevent) (65.4.1)
Requirement already satisfied: zope.event in /usr/local/lib/python3.10/site-packages (from gevent) (4.5.0)
Requirement already satisfied: zope.interface in /usr/local/lib/python3.10/site-packages (from gevent) (5.5.0)
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv

[notice] A new release of pip available: 22.2.2 -> 22.3
[notice] To update, run: python3.10 -m pip install --upgrade pip
# system requirements are set.
# proceeding as we have git
Getting the latest flasing software
Cloning into 'cc2538-bsl'...
remote: Enumerating objects: 453, done.
remote: Counting objects: 100% (41/41), done.
remote: Compressing objects: 100% (26/26), done.
remote: Total 453 (delta 19), reused 31 (delta 15), pack-reused 412
Receiving objects: 100% (453/453), 164.70 KiB | 830.00 KiB/s, done.
Resolving deltas: 100% (201/201), done.
# getting the latest firmware as of OCTOBER 2022 20220219
--2022-10-23 15:22:14--  https://raw.githubusercontent.com/Koenkk/Z-Stack-firmware/master/coordinator/Z-Stack_3.x.0/bin/CC1352P2_CC2652P_launchpad_coordinator_20220219.zip
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 185.199.110.133, 185.199.111.133, 185.199.108.133, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|185.199.110.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 171798 (168K) [application/zip]
Saving to: ‘firmware.zip’

firmware.zip                  100%[================================================>] 167.77K  --.-KB/s    in 0.05s

2022-10-23 15:22:14 (3.32 MB/s) - ‘firmware.zip’ saved [171798/171798]

# proceeding as we have unzip
Archive:  ./firmware.zip
  inflating: CC1352P2_CC2652P_launchpad_coordinator_20220219.hex
####
# IMPORTANT, Thus far we got a few files from the internet, be sure you are OK with it.
# IMPORTANT, Next up is flashing the firmware!
###
# MAC USERS: Serial device should be like '/dev/tty.usbserial-' not like '/dev/cu.usbserial-'
# Linux USERS: Serial device should be like '/dev/ttyUSB'
###
Are you sure? y
Get device ready for flashing:
This is a debug log
This is an info log
This is critical
An error occurred

/dev/cu.BLTH - n/a
/dev/cu.Bluetooth-Incoming-Port - n/a
/dev/cu.usbserial-1410 - Sonoff Zigbee 3.0 USB Dongle Plus
选择串口(输入串口序号即可):/dev/tty.usbserial-1410
>>>>>>>>>>>>>>>> /dev/tty.usbserial-1410 is opened.....
<queue.Queue object at 0x1024feb60>
<queue.Queue object at 0x1024feb90>
Write  processing...
Write  processing...
Read processing...
Log Print processing...
>>>>>>>>>>>>>>>> end
Please supply the serial port again:
/dev/tty.usbserial-1410
Flashing the device:
sonoff
Opening port /dev/tty.usbserial-1410, baud 500000
Reading data from CC1352P2_CC2652P_launchpad_coordinator_20220219.hex
Your firmware looks like an Intel Hex file
Connecting to target...
CC1350 PG2.0 (7x7mm): 352KB Flash, 20KB SRAM, CCFG.BL_CONFIG at 0x00057FD8
Primary IEEE Address: 00:12:4B:00:26:B8:80:79
    Performing mass erase
Erasing all main bank flash sectors
    Erase done
Writing 360448 bytes starting at address 0x00000000
Write 104 bytes at 0x00057F988
    Write done
Verifying by comparing CRC32 calculations.
    Verified (match: 0xddfc152d)
```
