# NGINX server

- **Nginx**: Nginx is well-known for its performance and efficiency. It's often used as a reverse proxy and load balancer but can also serve static content efficiently.

- To install NGINX server    
`sudo apt install nginx`    

- Navigate to the sites-enabled folder to make an entry point for your website   
`cd /etc/nginx/sites-available`    

- Create a file called Vortex-website    
`sudo vim Vortex-website.com`    

- Paste the server block code there, the second block is for a second website if you wish to host.
```
server {
    listen 80;
    listen [::]:80;
    server_name Vortex-Website;
    root /var/www/;
    index index.html;

    location / {
	include  /etc/nginx/mime.types;
    }
}
```

- If you want to create another server then create another file and add this server block   

- Create a file called Vortex-website     
`sudo vim portfolio-website.com` 

- Add the code to it   

```
server {

    listen 80;
    listen [::]:80;
    server_name portfolio-website;
    root /var/www;
    index index.html;

location / {
    	try_files $uri $uri/ =404;
    }
}
```

- After creating the server blocks, navigate to sites-enable directory   
`cd /etc/nginx/sites-enable`

- Create a symlink to the files in the sites-enable directory to enable them    
`sudo ln -s /etc/nginx/sites-available/Vortex-Website.com /etc/nginx/sites-enabled/Vortex-Website.com`

- Navigate to the folder to create the static webpage folder    
`cd /var/www`

- Create or clone the website folder here.   
`sudo git clone https://github.com/srushtim-01/Vort3x-Website.git`   

- Change permissions of the folder so that the user can perform git pull, push actions from within this folder   
`sudo chmod -R 755 /var/www/Vortex-Website

- You can safely reload nginx    
`sudo nginx -s reload`


