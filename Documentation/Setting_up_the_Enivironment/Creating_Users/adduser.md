## **`adduser`**

**(Interactive Method - Preferred for Beginners)**

Some Linux distributions, like Debian and Ubuntu, provide a friendlier tool called `adduser` that simplifies the process and guides you through account creation:

1. Open a terminal on your Linux system.
2. Run the `adduser` command followed by the desired username:
    
    ```bash
    sudo adduser newuser
    ```
    
    Follow the on-screen prompts to set the password and provide additional user information.
    
    - You can leave most of the additional user information blank if you don't want to provide it.
    - When asked for the user's password, enter and confirm it.
3. The `adduser` command automatically creates a home directory for the user and sets up the user environment.
4. The user account is now created and ready to use.

After creating a new user account, you can grant administrative privileges (sudo access) if needed. To do this, you can add the user to the "sudo" group:

```bash
sudo usermod -aG sudo newuser
```

Replace "newuser" with the username you created.

That's it! You've created a new user account on your Linux system. Users can now log in with their username and password, and if granted sudo access, they can perform administrative tasks with the `sudo` command.