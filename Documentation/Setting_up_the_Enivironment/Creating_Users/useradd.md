## **`useradd`**

**(Basic Method)**

1. Open a terminal on your Linux system.
2. To create a new user, you can use the `useradd` command followed by the username you want to create. For example, to create a user named "newuser" run:
    
    ```bash
    sudo user add newuser
    ```
    
3. Set a password for the new user. Use the `passwd` command:
    
    ```bash
    sudo passwd newuser
    ```
    
    You'll be prompted to enter and confirm the new password.
    
4. Optionally, you can create a home directory for the user. This is typically done automatically, but if needed, you can create it manually:
    
    ```bash
    sudo mkdir /home/newuser
    sudo chown newuser:newuser /home/newuser
    ```
    
5. The user is now created and can log in with the provided username and password.