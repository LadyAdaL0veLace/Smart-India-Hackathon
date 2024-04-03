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
