<h1> To run Nginx and Apache on the same server </h1>


#The most common setup is a Reverse Proxy. In this scenario, Nginx handles the initial incoming traffic (Port 80/443) and "proxies" specific requests (like dynamic PHP files) to Apache, which listens on a different port

#Configure Apache to Listen on a Different Port 
#By default, Apache uses port 80. You must change it to something like 8080 so Nginx can take over port 80. 

#Edit the ports file: Open /etc/apache2/ports.conf and change Listen 80 to Listen 127.0.0.1:8080.

#Update Virtual Hosts: Edit your Apache site config (e.g., /etc/apache2/sites-available/000-default.conf) and change the top line from <VirtualHost *:80> to <VirtualHost 127.0.0.1:8080>.

#Restart Apache: Run sudo systemctl restart apache2.

#Test the config: sudo nginx -t.

#Reload Nginx: sudo systemctl reload nginx. 

<h1> Why use this setup? </h1>

1.) Performance: Nginx is significantly faster at serving "static" content like images and CSS.

2.) Flexibility: You can still use Apache features like .htaccess files for your dynamic app.

3.) Security: Nginx acts as a "shield," hiding Apache from direct internet exposure
