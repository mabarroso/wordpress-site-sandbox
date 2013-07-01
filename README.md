#Wordpress site sandbox
  Wordpress site up and running for testing

#Description
  Install and configure a english Wordpress site named *test* running at [http://localhost/wordpress-site-sandbox/](http://localhost/wordpress-site-sandbox/)
  with admin user named *test*, email test@test.test and password *testtest*.

# Installation

## Manual instalation
  Go to your webserver document root, for example /var/www/

  ```shell
    git clone https://github.com/mabarroso/wordpress-site-sandbox.git
    mysqladmin -u root create sanboxwordpresssimply
    mysql -u root sanboxwordpresssimply < wordpress-site-sandbox/tools/database.sql
  ```

## Vagrant instalation
  ```shell
    git clone https://github.com/mabarroso/wordpress-site-sandbox.git
    vagrant up
  ```

Vagrant guest port 80 must be forwaded to 8080. Any port under 1024 requires the program to be running as root. To point host port 80 to another port in

* Mac OS/X, use the ipfw utility

  ```shell
    sudo ipfw add 100 fwd 127.0.0.1,8080 tcp from any to any 80 in
  ```

* Windows, use the netsh command

  ```shell
    netsh interface portproxy add v4tov4 listenport=80 listenaddress=127.0.0.1 connectport=8080 connectaddress=127.0.0.1
  ```

* Linux, accomplish the redirection with iptables

  ```shell
    iptables -A INPUT -i eth0 -p tcp --dport 80 -j ACCEPT
    iptables -A INPUT -i eth0 -p tcp --dport 8080 -j ACCEPT
    iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080
  ```


## Customization
  Modify wordpress-site-sandbox/tools/database.sql file to change the site URL

# License
  Released under the MIT license: [http://www.opensource.org/licenses/MIT](http://www.opensource.org/licenses/MIT)
