# NGINX server

- **Nginx**: Nginx is well-known for its performance and efficiency. It's often used as a reverse proxy and load balancer but can also serve static content efficiently.

- To install NGINX server    
`sudo apt install nginx`    

- Navigate to the sites-enabled folder to make an entry point for your website   
`cd /etc/nginx/sites-enabled`    

- Create a file called Vortex-website    
`sudo vim Vortex-website.com`    

- Paste the server block code there, the second block is for a second website if you wish to host.
```
server {

    listen 80;
    listen [::]:80;
    server_name Vortex-Website;
    root /var/www;
    index index.html;

    location /css {
        alias /var/www/css;
        try_files $uri $uri/ /style.css;
    }

    location / {
	try_files $uri $uri/ =404;
    }
}

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

- Navigate to the folder to create the static webpage folder    
`cd /var/www`

- Create or clone the website folder here.   
`sudo git clone https://github.com/srushtim-01/Vort3x-Website.git`   

- You can safely reload nginx    
`sudo nginx -s reload`


