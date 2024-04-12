#include <stdio.h>
#include <unistd.h>

int main() {
    // Define the path to arduino-cli
    char *path = "/usr/bin/arduino-cli";

    // Check if the file exists
    if (access(path, F_OK) != -1) {
        printf("\nCongragulations arduino-cli is successfully installed at %s\n\nNext level details\nUsername: bytex01\nPassword: bytex01\n\n", path);
    } else {
        printf("arduino-cli is not installed, please do so to gain access to the next level\n", path);
    }

    return 0;
}

