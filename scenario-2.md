# Q2: Scenario

## Checking The web server environment
1. To check the current DNS server we can run ```sudo resolvectl status``` and compare it to the desired DNS "8.8.8.8"

2. To check if the service is enabled and started or not we can use ```systemctl status nginx``` "*nginx here is just an example*"

3. And we should have a look at the logs of the service using ```sudo journalctl -u nginx``` to check if there're any errors or misconfiguration happened during an update or configuration change.

4. Checking firewall setting `ufw for example` enteries by using ``` sudo ufw status numbered``` to check if the firewall is denying the service incomming trafic 

## now these are the most common reasons for a web server to have while trying to be accessible, lets solve them!

## solving the problems
1- We can use this command to add a specific dns server to the interface we desire ```sudo resolvectl dns enp0s9 8.8.8.8``` 

2- To make sure the service is started and enabled on every boot```sudo systemctl enable nginx; sudo systemctl start nginx```

3- edit any missconfiguration on the ```/etc/nginx/ngnix.conf``` file or check the site in ```/etc/nginx/sites-enabled/``` directory because they may change by mistake during system or service update "nginx used as an example".

4- enable ingoing traffic for the service from 80,443 ports "using ufw for example"
```sudo ufw allow in 443``` with more arguments passed if needed 

5- checking ip links connectivity using `ip link` & `ip -c add` to make sure the used interface is online.

---

 Any of these could be a reason for the service to not work properly on localhost, or across network

and to check if the solutions were correct we can simply ```curl localhost:443``` or port 80 to make sure the web dashboard is online again.


and to add a local dns entry `10.20.30.40  internal.example.com` to the /etc/hosts file, which will override other dns configuration (based on the /etc/nsswitch.conf file)
