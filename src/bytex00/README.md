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

### Download the latest Arduino CLI binary
`curl -fsSL https://downloads.arduino.cc/arduino-cli/arduino-cli_latest_Linux_64bit.tar.gz -o arduino-cli.tar.gz`

### Extract the downloaded archive
`tar xf arduino-cli.tar.gz`

### Move arduino-cli to a directory in PATH
`sudo mv arduino-cli /usr/local/bin/`

### Clean up
`rm arduino-cli.tar.gz`

### Verify installation

- Type **arduino-cli** on the terminal, you should see some output, else your installation didn't work

- Also try running the **password.sh** file to get the password to the next level `./password.sh`
