# Q2: Scenario

## Checking the web server environment
1. To check the current DNS server, we can run this command and compare it to the desired DNS "8.8.8.8"
```bash
sudo resolvectl status
```


2. To check if the service is enabled and started, or not, we can use "*nginx here is just an example*"
```bash
systemctl status nginx
```
 

3. And we should have a look at the logs of the service using this command to check if there're any errors or misconfiguration happened during an update or configuration change.
```
sudo journalctl -u nginx
```
 

4. Checking firewall settings `ufw for example` entries by using this command to check if the firewall is denying the service incoming traffic.
``` 
sudo ufw status numbered
``` 

## Now these are the most common problems that a web server have making it inaccessible, let's solve them! 
---

## solving the problems
1- We can use this command to add a specific dns server to the interface we desire
```
sudo resolvectl dns enp0s9 8.8.8.8
``` 

2- To make sure the service is started and enabled on every boot
```
sudo systemctl enable nginx; sudo systemctl start nginx
```

3- edit any missconfiguration on the ```/etc/nginx/ngnix.conf``` file or check the site in ```/etc/nginx/sites-enabled/``` directory because they may change by mistake during system or service update "nginx used as an example".

4- enable ingoing traffic for the service from 80,443 ports "using ufw for example", and with more arguments passed if needed
```
bash sudo ufw allow in 443
```  

5- checking IP link connectivity using these commands to make sure the used interface is online and has obtained an IP.
```
ip link
ip -c addr
```


> ##  Any of these could be a reason for the service to not work properly on localhost, or across the network
---

- And to check if the solutions were correct we can simply run this command on port 443 or port 80 to make sure the web dashboard is online again.
```
curl localhost:443
```

- and to add a local dns entry `10.20.30.40  internal.example.com` to the /etc/hosts file, which will override other dns configuration (based on the /etc/nsswitch.conf file)
- I didn't provide screenshots because there's no actull dashboard, it's a "scenario" so I didn't know what to provide.
