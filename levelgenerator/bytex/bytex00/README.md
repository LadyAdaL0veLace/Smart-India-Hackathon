#!/usr/bin/glow

```
██████╗ ██╗   ██╗████████╗███████╗██╗  ██╗ ██████╗  ██████╗
██╔══██╗╚██╗ ██╔╝╚══██╔══╝██╔════╝╚██╗██╔╝██╔═████╗██╔═████╗
██████╔╝ ╚████╔╝    ██║   █████╗   ╚███╔╝ ██║██╔██║██║██╔██║
██╔══██╗  ╚██╔╝     ██║   ██╔══╝   ██╔██╗ ████╔╝██║████╔╝██║
██████╔╝   ██║      ██║   ███████╗██╔╝ ██╗╚██████╔╝╚██████╔╝
╚═════╝    ╚═╝      ╚═╝   ╚══════╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝
```
 
# INTRODUCTION

- Welcome to level zero of the BYTEX challenges

- This level will teach you how to install the **arduino-cli** software for the arduino UNO bloard

### install the script
```./install_arduino_cli.sh```

### If you don’t know what kind of board you have, simply connect it to the Raspberry Pi via USB, type the following command and examine the output:
```arduino-cli board list```

```
OUTPUT	
Port         Protocol Type              Board Name  FQBN            Core
/dev/ttyACM0 serial   Serial Port (USB) Arduino Uno arduino:avr:uno arduino:avr
```

- Here /dev/ttyACM0 is the port number, you must remember this to upload you code next time.

### Verify installation

- Type **arduino-cli** on the terminal, you should see some output, else your installation didn't work

- Also try running the **password.sh** file to get the password to the next level ```./password.sh```

