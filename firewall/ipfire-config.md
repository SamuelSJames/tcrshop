# IPFire configuration instructions
****The intstallation process is pretty striaght forward. I chose for this small network RED & GREEN network only. So 1 wan and 1 LAN!****

We will begin in the terminal of  IPFire:
1. login with root and password

2. update and upgrade:
```bash
pakfire update
pakfire upgrade
```
![UPDATE](/tcrshop/assets/ipfire1.png)

3. Now lets install the following packages:
```bash
pakfire install git
pakfire install guardian
pakfire install speedtest-cli
```
### **Guardian** - protects against SSH brute-force attacks & brute-force attacks against the IPFire WebUI

![Guardian_install](/tcrshop/assets/guarding_install.png)

#### ***note:*** You should get something like this:
![gaurdian_output](/tcrshop/assets/guarding_output.png)

#### ****OPTIONAL**** > I prefer this editor over vi 
3a. Install micro text editor

```bash
  curl https://getmic.ro | bash
  cp micro /usr/bin/
```
![micro](/tcrshop/assets/micro_install.png)

### Connect your macbook or computer of choice and go to the web-ui https:ipfire.trslan:444
Make whatever changes you want to make to your firewall such as mail-service, custom rules ect...

## Back to Firewall CLI
Now it's time to prep our fireall with vlans and nat using the "firwall.local.sh" script

4. Navigateto the "/etc/sysconfig/" folder and bakup the "firewall.local file

```bash
cp firewall.local firewall.local.bak
```
5. copy and past the firewall.local to /etc/sysconfig/firewall.local

6. Now run the following command:

```bash
/etc/sysconfig/firewall.local restart
```
Now your IPFire router will have vlans setup and configured. Note: You might have to run this command on reboot every time.