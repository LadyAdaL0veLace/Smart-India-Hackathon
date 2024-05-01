#!/usr/bin/glow

```
██████╗ ██╗   ██╗████████╗███████╗██╗  ██╗ ██████╗ ██████╗
██╔══██╗╚██╗ ██╔╝╚══██╔══╝██╔════╝╚██╗██╔╝██╔═████╗╚════██╗
██████╔╝ ╚████╔╝    ██║   █████╗   ╚███╔╝ ██║██╔██║ █████╔╝
██╔══██╗  ╚██╔╝     ██║   ██╔══╝   ██╔██╗ ████╔╝██║██╔═══╝
██████╔╝   ██║      ██║   ███████╗██╔╝ ██╗╚██████╔╝███████╗
╚═════╝    ╚═╝      ╚═╝   ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝
```

# ....................::AnalogWrite()::....................

- This level will teach you how to fade an led using the **analogWrite**

## Tasks

### Create a new sketch called fade
```arduino-cli sketch new fade```

### Open the nano editor to edit the code:
```nano fade/fade.ino```

### The fade folder will be created with the fade.ino file inside. Now we edit the ino file:


```
#define ledPin 15

void setup() {
  pinMode(ledPin, OUTPUT);
}

void loop() {
  for(int i=0; i<255; i++){
	analogWrite(ledPin, i);
	delay(100);
  }
}
```

### Save the file with Ctrl+O and close it with CTRL+X.

### Compile Syntax: arduino-cli compile --fqbn arduino:board_name fade/
```arduino-cli compile --fqbn arduino:avr:uno fade/```

### Upload
```arduino-cli upload -p /dev/ttyACM0 --fqbn arduino:avr:uno fade/```


## Your task

- Create a new sketch named fade1
- Your task is to fade multiple leds connected to pin numbers 15, 12, 3 and 5
- connect CN9 to CN4
