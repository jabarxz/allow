# Tukar ke cloudeflire DNS
```
apt-get install -y resolvconf
systemctl enable resolvconf.service
systemctl start resolvconf.service
echo -e 'search google.com
nameserver 1.1.1.1
nameserver 1.0.0.1' > /etc/resolvconf/resolv.conf.d/head
ln -fs /etc/resolvconf/run/resolv.conf /etc/resolv.conf
resolvconf --enable-updates
resolvconf -u
```
#✔️ SCRIPT INSTALL ACC VLESS✔️
```
wget -q -O /usr/bin/vpn "https://raw.githubusercontent.com/jabarxz/allow/main/acc.sh" && chmod +x /usr/bin/vpn && apt install make && apt install gcc && apt install shc
```
# ✔️ UPDATE ACC VLESS ✔️
```
rm -f /usr/bin/vpn && wget -q -O /usr/bin/vpn "https://raw.githubusercontent.com/jabarxz/allow/main/acc.sh" && chmod +x /usr/bin/vpn && apt install make && apt install gcc && apt install shc
```
