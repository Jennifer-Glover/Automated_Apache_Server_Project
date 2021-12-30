FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y vim
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN apt-get install -y apache2
RUN apt-get install -y apache2-utils
RUN apt-get clean 
RUN apt-get update

# Enabled directives
RUN a2enmod userdir
RUN a2enmod autoindex
RUN a2enmod rewrite 
RUN a2enmod alias
RUN a2enmod cgi
RUN a2enmod ssl
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_balancer
RUN a2enmod lbmethod_byrequests

# Add 2 users
RUN adduser --force-badname --disabled-password --gecos "" user1
RUN adduser --force-badname --disabled-password --gecos "" user2

# Add users to cit384 group
RUN addgroup cit384
RUN usermod -aG cit384 user1
RUN usermod -aG cit384 user2

## For both users the images do not work unless you put a tilde ~ 

# Add user1 html file 
WORKDIR /home/user1
RUN mkdir public_html
RUN chmod 755 public_html
WORKDIR /home/user1/public_html
COPY user1.html .
COPY user1.png . 
RUN mv user1.html index.html

# Add user2 html file 
WORKDIR /home/user2
RUN mkdir public_html
RUN chmod 755 public_html
WORKDIR /home/user2/public_html
COPY user2.html .
COPY user2.png . 
RUN mv user2.html index.html

# Add final.cit384 vHost
WORKDIR /etc/apache2/sites-available
COPY final.cit384.conf .
RUN a2ensite final.cit384.conf

#Add mywebsite.cit384 vHost and copy html file
WORKDIR /var/www/html
RUN mkdir -p /var/www/html/mywebsite.cit384/public_html
RUN chown -R $USER:$USER /var/www/html/mywebsite.cit384/public_html
RUN chmod -R 755 /var/www/html
WORKDIR /var/www/html/mywebsite.cit384/public_html
COPY mywebsite.cit384.html .
RUN mv mywebsite.cit384.html index.html 
WORKDIR /etc/apache2/sites-available
COPY mywebsite.cit384.conf .
RUN a2ensite mywebsite.cit384.conf

# Add special.cit384 vHost and copy html file
WORKDIR /var/www/html
RUN mkdir -p /var/www/html/special.cit384/public_html
RUN chown -R $USER:$USER /var/www/html/special.cit384/public_html
RUN chmod -R 755 /var/www/html
WORKDIR /var/www/html/special.cit384/public_html
COPY special.cit384.html .
RUN mv special.cit384.html index.html 
WORKDIR /etc/apache2/sites-available
COPY special.cit384.conf .
RUN a2ensite special.cit384.conf

 ### The force to HTTPS and the rewrite to final.cit384 works for mywebsite and special. 
 ## BUT it does not ask for the password when visiting submission, it goes into the directory. 

# Adding password protected submission directory to final.cit384
WORKDIR /var/www/html/final.cit384
RUN mkdir submission 
RUN chmod 755 /var/www/html/final.cit384/submission
WORKDIR /var/www/html/final.cit384/submission
COPY submission.md .
WORKDIR /home/
RUN htpasswd -b -c /var/www/html/final.cit384/submission/.htpasswd user1 pass
WORKDIR /var/www/html/final.cit384/submission/
COPY htaccess .
RUN mv htaccess .htaccess

# Add submission.txt to /home
WORKDIR /home
COPY submission.txt .

# Create cgi-bin directory and add cgi script to user2 that cats user1. Put tilde after user2... '~user2'
RUN mkdir /home/user2/public_html/cgi-bin
RUN chmod 777 /home/user2/public_html/cgi-bin
WORKDIR /home/user2/public_html/cgi-bin
COPY final.cgi .
RUN chmod 755 /home/user2/public_html/cgi-bin/final.cgi

# Add keys for mywebsite.cit384
WORKDIR /etc/ssl/certs
COPY mywebsite.cit384.crt .
COPY mywebsite.cit384.csr .
WORKDIR /etc/ssl/private
COPY mywebsite.cit384.key .

# Add keys for special.cit384
WORKDIR /etc/ssl/certs
COPY special.cit384.crt .
COPY special.cit384.csr .
WORKDIR /etc/ssl/private
COPY special.cit384.key .

# Add keys for final.cit384
WORKDIR /etc/ssl/certs
COPY final.cit384.crt .
COPY final.cit384.csr .
WORKDIR /etc/ssl/private
COPY final.cit384.key .

# Add vHost for new.cit384
WORKDIR /etc/apache2/sites-available
COPY new.cit384.conf .
RUN a2ensite new.cit384.conf

RUN a2dissite 000-default.conf

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]