# SCRIPT

This script comes from:
https://sonoff.tech/wp-content/uploads/2022/08/uartLog.zip
and is modified to wirk with linux and mac, It no longer works for Windows here is what is changed:

FROM:
```
# Line number 321
        SERIAL_PORT_CFG = {'name': "COM" + name,
```

TO:
```
# Line number 321
        SERIAL_PORT_CFG = {'name': name,
```
