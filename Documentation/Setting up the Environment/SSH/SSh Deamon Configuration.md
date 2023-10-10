## Configure

These will only be effective during the runtime once you reboot the system, all settings go to default

`sudo systemctl status ssh` 

`sudo systemctl start ssh` 

`sudo systemctl stop ssh`

`sudo systemctl restart ssh`

## Enable and disable the server

Enable ensures that the daemon is active and running after each reboot

`sudo systemctl enable ssh` 

Disable will keep the daemon off after reboot

`sudo systemctl disable ssh`

## ******SSH can be configured in the file******

`sudo nano /etc/ssh/sshd_config`