import RPi.GPIO as GPIO

# Suppress GPIO warnings
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BOARD)

led1 = 15
led2 = 12
led3 = 3
led4 = 5

GPIO.setup(led1, GPIO.OUT)
GPIO.setup(led2, GPIO.OUT)
GPIO.setup(led3, GPIO.OUT)
GPIO.setup(led4, GPIO.OUT)

def update_leds():
    # Turn off LED1 and LED3
    GPIO.output(led1, GPIO.LOW)
    GPIO.output(led2, GPIO.LOW)

    # Turn on LED2 and LED4
    GPIO.output(led3, GPIO.HIGH)
    GPIO.output(led4, GPIO.HIGH)

try:
    while(True):
        update_leds()
except KeyboardInterrupt:
    GPIO.cleanup()
