#!/usr/bin/glow

```
██████╗ ██╗   ██╗████████╗███████╗██╗  ██╗ ██████╗  ██╗
██╔══██╗╚██╗ ██╔╝╚══██╔══╝██╔════╝╚██╗██╔╝██╔═████╗███║
██████╔╝ ╚████╔╝    ██║   █████╗   ╚███╔╝ ██║██╔██║╚██║
██╔══██╗  ╚██╔╝     ██║   ██╔══╝   ██╔██╗ ████╔╝██║ ██║
██████╔╝   ██║      ██║   ███████╗██╔╝ ██╗╚██████╔╝ ██║
╚═════╝    ╚═╝      ╚═╝   ╚══════╝╚═╝  ╚═╝ ╚═════╝  ╚═╝
```

# ....................::INTRODUCTION::....................
- So you made it to level1

- This level will teach you how to blink an led using the **arduino-cli**

## Connections

- Connect CN9 to CN4

### Create our first sketch, the blink, with the command:
```arduino-cli sketch new Blink```

### Open the nano editor to edit the code:
```nano Blink/Blink.ino```

### The Blink folder will be created with the Blink.ino file inside. Now we edit the ino file and put the classic code for the blink:  
```
void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
}

void loop() {
  digitalWrite(LED_BUILTIN, HIGH);
  delay(1000);
  digitalWrite(LED_BUILTIN, LOW);
  delay(1000);
}
```

### Save the file with Ctrl+O and close it with CTRL+X.

## Compile Syntax: arduino-cli compile --fqbn arduino:board_name Blink/
```arduino-cli compile --fqbn arduino:avr:uno Blink/```

## Upload
```arduino-cli upload -p /dev/ttyACM0 --fqbn arduino:avr:uno Blink/```

# Your Task
- Your task is to create another sketch called blink1
- connect CN4 to CN9 
- blink an led connect to pin number 15, 12, 3 and 5
