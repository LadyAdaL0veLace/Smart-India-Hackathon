#!/usr/bin/glow

```
██╗     ███████╗██╗   ██╗███████╗██╗      ██████╗  ██████╗
██║     ██╔════╝██║   ██║██╔════╝██║     ██╔═████╗██╔═████╗
██║     █████╗  ██║   ██║█████╗  ██║     ██║██╔██║██║██╔██║
██║     ██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║     ████╔╝██║████╔╝██║
███████╗███████╗ ╚████╔╝ ███████╗███████╗╚██████╔╝╚██████╔╝
╚══════╝╚══════╝  ╚═══╝  ╚══════╝╚══════╝ ╚═════╝  ╚═════╝
```

# INTRODUCTION

- This level will teach you how to blink an led on the raspberry pi 3

- Connect CN9 to CN4, Dont forget this part your leds won't blink at all

- Create a file called blink.py 

- Try out the example code and later try implementing the challenge

- There are a total of 4 leds on the board on pin numbers

|  Led  |  Pin  |
|  :--- |  :--- |
|  led1 |  15	|
|  led2	|  12	|
|  led3 |  3	|
|  led4	|  5	|

## EXAMPLE CODE

```

import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BOARD)
GPIO.setwarnings(False)

led1 = 15

GPIO.setup(led1,GPIO.OUT)		        # pin is connected to LED and should be setup as out

print("Led is ON")
print("Press Ctrl+c to quit")

while(True):
    GPIO.output(led1, True)     

```

## CHALLENGE 0x00

- Turn led 2 and led 4 on and turn led 1 and led 3 off.
