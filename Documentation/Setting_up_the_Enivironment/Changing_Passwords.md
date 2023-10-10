To change the password for a user in Linux, you can use the `passwd` command. Here are the steps to change a user's password:

1. Open a terminal on your Linux system.
2. To change the password for a specific user, use the `passwd` command followed by the username. For example, to change the password for a user named "username," run:
    
    ```bash
    sudo passwd username
    
    ```
    
    Replace "username" with the actual username for which you want to change the password.
    
3. You will be prompted to enter and confirm the new password. Follow the on-screen instructions to set the new password.
    - When entering the new password, it won't be displayed on the screen for security reasons. Simply type the password and press Enter.
    - You will be asked to confirm the new password by entering it again.

The password for the specified user has now been changed. The user can use the new password to log in to the system.

Remember to use `sudo` when running the `passwd` command to ensure that you have the necessary privileges to change another user's password.
