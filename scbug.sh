#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="jabarxz"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
# Valid Script
VALIDITY () {
    today=`date -d "0 days" +"%Y-%m-%d"`
    Exp1=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $4}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32m✅YOUR SCRIPT ACTIVE..\e[0m"
    else
    echo -e "\e[31m❌YOUR SCRIPT HAS EXPIRED!\e[0m";
    echo -e "\e[31m🖍️Please renew your ipvps first\e[0m"
    exit 0
fi
}
IZIN=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | awk '{print $5}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32m✅Permission Accepted...\e[0m"
VALIDITY
else
echo -e "\e[31m❌Permission Denied!\e[0m";
echo -e "\e[31m🔓Please buy script first\e[0m"
exit 0
fi
echo -e "\e[32mloading...\e[0m"
clear
# PROVIDED
creditt=$(cat /root/provided)
# BANNER COLOUR
banner_colour=$(cat /etc/banner)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR ON TOP
text=$(cat /etc/text)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
# TOTAL ACC CREATE VMESS WS
total1=$(grep -c -E "^#vms " "/usr/local/etc/xray/config.json")
# TOTAL ACC CREATE  VLESS WS
total2=$(grep -c -E "^#vls " "/usr/local/etc/xray/config.json")
# TOTAL ACC CREATE  VLESS TCP XTLS
total3=$(grep -c -E "^#vxtls " "/usr/local/etc/xray/config.json")
# TOTAL ACC CREATE  TROJAN WS TLS
total4=$(grep -c -E "^#trws " "/usr/local/etc/xray/trojan.json")
MYIP=$(wget -qO- ifconfig.me/ip);
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /usr/local/etc/xray/domain)
else
domain=$IP
fi

# FUCTION ADD USER
function menu1 () {
clear
tls="$(cat ~/log-install.txt | grep -w "Vmess Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess Ws None Tls" | cut -d: -f2|sed 's/ //g')"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
echo -e   "  \e[$back_text           \e[30m[\e[$box CREATE USER XRAY VMESS WS TLS\e[30m ]\e[1m           \e[m"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "   Username: " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
patchtls=/xray-vmessws-tls
patchnontls=/xray-vmessws-none-tls
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "   Bug Address (Example: www.google.com) : " address
read -p "   Bug SNI/Host (Example : m.facebook.com) : " sni
read -p "   Expired (days) : " masaaktif
bug_addr=${address}.
bug_addr2=$address
if [[ $address == "" ]]; then
sts=$bug_addr2
else
sts=$bug_addr
fi
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
harini=`date -d "0 days" +"%Y-%m-%d"`
sed -i '/#xray-vmess-tls$/a\#vms '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/config.json
sed -i '/#xray-vmess-nontls$/a\#vms '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/none.json
cat>/usr/local/etc/xray/$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "ufuture.uitm.edu.my",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "$patchtls",
      "type": "none",
      "host": "${sts}${domain}",
      "tls": "tls",
	  "sni": "ufuture.uitm.edu.my"
}
EOF
cat>/usr/local/etc/xray/$user-celcom.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "onlinepayment.celcom.com.my",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "onlinepayment.celcom.com.my$patchtls",
      "type": "none",
      "host": "${sts}${domain}",
      "tls": "tls",
	  "sni": "onlinepayment.celcom.com.my"
}
EOF
cat>/usr/local/etc/xray/$user-none.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "eurohealthobservatory.who.int",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "$patchnontls",
      "type": "none",
      "host": "${sts}${domain}",
      "tls": "none"
}
EOF
cat>/usr/local/etc/xray/$user-digi.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "api.useinsider.com",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "$patchnontls",
      "type": "none",
      "host": "${sts}${domain}",
      "tls": "none"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmess_base644=$( base64 -w 0 <<< $vmess_json4)
vmesslink1="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-tls.json)"
vmesslink2="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-celcom.json)"
vmesslink3="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-none.json)"
vmesslink4="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-digi.json)"
systemctl restart xray@vmess
systemctl restart xray@vmessnone
service cron restart
clear
echo -e ""
echo -e "\e[$line═════════[XRAY VMESS WS]═════════\e[m"
echo -e "☢️Remarks        : ${user}"
echo -e "☢️Created         : $harini"
echo -e "☢️Expired         : $exp"
echo -e "☢️Domain         : ${domain}"
echo -e "☢️IP/Host        : $MYIP"
echo -e "☢️Port TLS       : ${tls}"
echo -e "☢️Port None TLS  : ${none}"
echo -e "☢️User ID        : ${uuid}"
echo -e "☢️Security       : Auto"
echo -e "☢️Network        : Websocket"
echo -e "☢️Path Tls       : $patchtls"
echo -e "☢️Path None Tls  : $patchnontls"
echo -e "☢️AllowInsecure  : True/Allow"
echo -e "☢️Support Yaml   : YES"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Pantang Larang $creditt Shop"
echo -e "‼️Aktiviti Berikut Adalah Dilarang(ID akan di ban tanpa notis & tiada refund)"
echo -e "\e[31m❌ Torrent (p2p, streaming p2p)"
echo -e "\e[31m❌ PS4"
echo -e "\e[31m❌ Porn"
echo -e "\e[31m❌ Spam Bug"
echo -e "\e[31m❌ Ddos Server"
echo -e "\e[31m❌ Mining Bitcoins"
echo -e "\e[31m❌ Abuse Usage"
echo -e "\e[31m❌ Multi-Login ID"
echo -e "\e[31m❌ Sharing Premium Config\e[m"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Script By $creditt"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Maxis)   : ${vmesslink1}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Celcom)  : ${vmesslink2}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Yes)     : ${vmesslink3}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Digi)    : ${vmesslink4}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created   :$harini"
echo -e "Expired   :$exp"
echo -e "Script By $creditt"
}
# TRIAL USER
function menu2 () {
clear
tls="$(cat ~/log-install.txt | grep -w "Vmess Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess Ws None Tls" | cut -d: -f2|sed 's/ //g')"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
echo -e   "  \e[$back_text           \e[30m[\e[$box TRIAL USER XRAY VMESS WS TLS\e[30m ]\e[1m            \e[m"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
# Create Expried 
masaaktif="1"
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")

# Make Random Username 
user=Trial`</dev/urandom tr -dc X-Z0-9 | head -c4`

patchtls=/xray-vmessws-tls
patchnontls=/xray-vmessws-none-tls
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "   Bug Address (Example: www.google.com) : " address
read -p "   Bug SNI/Host (Example : m.facebook.com) : " sni
bug_addr=${address}.
bug_addr2=$address
if [[ $address == "" ]]; then
sts=$bug_addr2
else
sts=$bug_addr
fi
harini=`date -d "0 days" +"%Y-%m-%d"`
sed -i '/#xray-vmess-tls$/a\#vms '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/config.json
sed -i '/#xray-vmess-nontls$/a\#vms '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/none.json
cat>/usr/local/etc/xray/$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "ufuture.uitm.edu.my",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "$patchtls",
      "type": "none",
      "host": "${sts}${domain}",
      "tls": "tls",
	  "sni": "ufuture.uitm.edu.my"
}
EOF
cat>/usr/local/etc/xray/$user-celcom.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "onlinepayment.celcom.com.my",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/onlinepayment.celcom.com.my$patchtls",
      "type": "none",
      "host": "${sts}${domain}",
      "tls": "tls",
	  "sni": "onlinepayment.celcom.com.my"
}
EOF
cat>/usr/local/etc/xray/$user-none.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "www.who.int",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/www.who.int$patchnontls",
      "type": "none",
      "host": "${sts}${domain}",
      "tls": "none"
}
EOF
cat>/usr/local/etc/xray/$user-digi.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "api.useinsider.com",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "$patchnontls",
      "type": "none",
      "host": "${sts}${domain}",
      "tls": "none"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmess_base644=$( base64 -w 0 <<< $vmess_json4)
vmesslink1="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-tls.json)"
vmesslink2="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-celcom.json)"
vmesslink3="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-none.json)"
vmesslink4="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-digi.json)"
systemctl restart xray@vmess
systemctl restart xray@vmessnone
service cron restart
clear
echo -e ""
echo -e "\e[$line══════[TRIAL XRAY VMESS WS]══════\e[m"
echo -e "☢️Remarks        : ${user}"
echo -e "☢️Created         : $harini"
echo -e "☢️Expired         : $exp"
echo -e "☢️Domain         : ${domain}"
echo -e "☢️IP/Host        : $MYIP"
echo -e "☢️Port TLS       : ${tls}"
echo -e "☢️Port None TLS  : ${none}"
echo -e "☢️User ID        : ${uuid}"
echo -e "☢️Security       : Auto"
echo -e "☢️Network        : Websocket"
echo -e "☢️Path Tls       : $patchtls"
echo -e "☢️Path None Tls  : $patchnontls"
echo -e "☢️AllowInsecure  : True/Allow"
echo -e "☢️Support Yaml   : YES"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Pantang Larang $creditt Shop"
echo -e "‼️Aktiviti Berikut Adalah Dilarang(ID akan di ban tanpa notis & tiada refund)"
echo -e "\e[31m❌ Torrent (p2p, streaming p2p)"
echo -e "\e[31m❌ PS4"
echo -e "\e[31m❌ Porn"
echo -e "\e[31m❌ Spam Bug"
echo -e "\e[31m❌ Ddos Server"
echo -e "\e[31m❌ Mining Bitcoins"
echo -e "\e[31m❌ Abuse Usage"
echo -e "\e[31m❌ Multi-Login ID"
echo -e "\e[31m❌ Sharing Premium Config\e[m"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Script By $creditt"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Maxis)   : ${vmesslink1}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Celcom)  : ${vmesslink2}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Yes)     : ${vmesslink3}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Digi)    : ${vmesslink4}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created   :$harini"
echo -e "Expired   :$exp"
echo -e "Script By $creditt"
}
# FUCTION DELETE USER
function menu3 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vms " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo " Delete User Xray Vmess Ws"
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " ==============================="
	echo "     No  Expired   User"
	grep -E "^#vms " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done	
harini=$(grep -E "^#vms " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^#vms " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^#vms " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#vms " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^#vms $user $exp $harini $uuid/,/^},{/d" /usr/local/etc/xray/config.json
sed -i "/^#vms $user $exp $harini $uuid/,/^},{/d" /usr/local/etc/xray/none.json
rm -f /usr/local/etc/xray/$user-tls.json
rm -f /usr/local/etc/xray/$user-none.json
rm -f /usr/local/etc/xray/$user-clash-for-android.yaml
rm -f /home/vps/public_html/$user-clash-for-android.yaml
systemctl restart xray
systemctl restart xray@none
clear
echo " XRAY VMESS WS Account Deleted Successfully"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp"
echo " =========================="
}
# FUCTION RENEW USER
function menu4 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vms " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo "Renew User Xray Vmess Ws"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^#vms " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (days): " masaaktif
harini=$(grep -E "^#vms " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^#vms " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^#vms " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#vms " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/#vms $user $exp $harini $uuid/#vms $user $exp4 $harini $uuid/g" /usr/local/etc/xray/config.json
sed -i "s/#vms $user $exp $harini $uuid/#vms $user $exp4 $harini $uuid/g" /usr/local/etc/xray/none.json
service cron restart
clear
echo ""
echo " VMESS WS & Clash Account Was Successfully Renewed"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo " =========================="
}
# show user
function menu5 () {
clear
tls="$(cat ~/log-install.txt | grep -w "Vmess Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess Ws None Tls" | cut -d: -f2|sed 's/ //g')"
NUMBER_OF_CLIENTS=$(grep -c -E "^#vms " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "SHOW USER XRAY VMESS WS"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^#vms " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
patchtls=/xray-vmessws-tls
patchnontls=/xray-vmessws-none-tls
user=$(grep -E "^#vms " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
harini=$(grep -E "^#vms " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#vms " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^#vms " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
cat>/usr/local/etc/xray/$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "ufuture.uitm.edu.my",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "$patchtls",
      "type": "none",
      "host": "${sts}${domain}",
      "tls": "tls",
	  "sni": "ufuture.uitm.edu.my"
}
EOF
cat>/usr/local/etc/xray/$user-celcom.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "onlinepayment.celcom.com.my",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "$patchtls",
      "type": "none",
      "host": "${sts}${domain}",
      "tls": "tls",
	  "sni": "onlinepayment.celcom.com.my"
}
EOF
cat>/usr/local/etc/xray/$user-none.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "www.who.int",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "$patchnontls",
      "type": "none",
      "host": "${sts}${domain}",
      "tls": "none"
}
EOF
cat>/usr/local/etc/xray/$user-digi.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "api.useinsider.com",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "$patchnontls",
      "type": "none",
      "host": "${sts}${domain}",
      "tls": "none"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmess_base644=$( base64 -w 0 <<< $vmess_json4)
vmesslink1="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-tls.json)"
vmesslink2="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-celcom.json)"
vmesslink3="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-none.json)"
vmesslink4="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-digi.json)"
systemctl restart xray@vmess
systemctl restart xray@vmessnone
service cron restart
clear
echo -e ""
echo -e "\e[$line═════════[XRAY VMESS WS]═════════\e[m"
echo -e "☢️Remarks        : ${user}"
echo -e "☢️Created         : $harini"
echo -e "☢️Expired         : $exp"
echo -e "☢️Domain         : ${domain}"
echo -e "☢️IP/Host        : $MYIP"
echo -e "☢️Port TLS       : ${tls}"
echo -e "☢️Port None TLS  : ${none}"
echo -e "☢️User ID        : ${uuid}"
echo -e "☢️Security       : Auto"
echo -e "☢️Network        : Websocket"
echo -e "☢️Path Tls       : $patchtls"
echo -e "☢️Path None Tls  : $patchnontls"
echo -e "☢️AllowInsecure  : True/Allow"
echo -e "☢️Support Yaml   : YES"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Pantang Larang $creditt Shop"
echo -e "‼️Aktiviti Berikut Adalah Dilarang(ID akan di ban tanpa notis & tiada refund)"
echo -e "\e[31m❌ Torrent (p2p, streaming p2p)"
echo -e "\e[31m❌ PS4"
echo -e "\e[31m❌ Porn"
echo -e "\e[31m❌ Spam Bug"
echo -e "\e[31m❌ Ddos Server"
echo -e "\e[31m❌ Mining Bitcoins"
echo -e "\e[31m❌ Abuse Usage"
echo -e "\e[31m❌ Multi-Login ID"
echo -e "\e[31m❌ Sharing Premium Config\e[m"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Script By $creditt"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Maxis)   : ${vmesslink1}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Celcom)  : ${vmesslink2}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Yes)     : ${vmesslink3}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Digi)    : ${vmesslink4}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created   :$harini"
echo -e "Expired   :$exp"
echo -e "Script By $creditt"
}
# FUCTION CEK USER
function menu6 () {
clear
echo -n > /tmp/other.txt
data=( `cat /usr/local/etc/xray/config.json | grep '^#vms' | cut -d ' ' -f 2`); 
echo "-----------------------------------------";
echo "------=[ Xray Vmess Ws User Login ]=-----";
echo "-----------------------------------------";
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/ipvmess.txt
data2=( `netstat -anp | grep ESTABLISHED | grep tcp6 | grep xray | awk '{print $5}' | cut -d: -f1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access.log | grep -w $akun | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipvmess.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipvmess.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipvmess.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipvmess.txt | nl)
echo "user : $akun";
echo "$jum2";
echo ""
echo "-------------------------------"
fi
rm -rf /tmp/ipvmess.txt
done
}
# ADD USER VLESS WS
function menu7 () {
clear
tls="$(cat ~/log-install.txt | grep -w "Vless Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless Ws None Tls" | cut -d: -f2|sed 's/ //g')"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
echo -e   "  \e[$back_text           \e[30m[\e[$box CREATE USER XRAY VLESS WS TLS\e[30m ]\e[1m           \e[m"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "   Username: " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
patchtls=/xray-vlessws-tls
patchnontls=/xray-vlessws-none-tls
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "   Bug Address (Example: www.google.com) : " address
read -p "   Bug SNI/Host (Example : m.facebook.com) : " sni
read -p "   Expired (days) : " masaaktif
bug_addr=${address}.
bug_addr2=$address
if [[ $address == "" ]]; then
sts=$bug_addr2
else
sts=$bug_addr
fi
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
harini=`date -d "0 days" +"%Y-%m-%d"`
sed -i '/#xray-vless-tls$/a\#vls '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/config.json
sed -i '/#xray-vless-nontls$/a\#vls '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/none.json
vlesslink1="vless://${uuid}@www.unisza.edu.my.${domain}:$tls?path=/xray-vlessws-tls&sni=mycampus.upnm.edu.my&host=mycampus.upnm.edu.my&security=tls&encryption=none&type=ws&sni=mycampus.upnm.edu.my#${user}"
vlesslink2="vless://${uuid}@www.umk.edu.my.${domain}:$tls?path=/xray-vlessws-tls&sni=smpk.moe.gov.my&host=smpk.moe.gov.my&security=tls&encryption=none&type=ws&sni=smpk.moe.gov.my#${user}"
vlesslink3="vless://${uuid}@live.iqiyi.com.${domain}:$tls?path=/xray-vlessws-tls&sni=esports.pubgmobile.com&host=esports.pubgmobile.com&security=tls&encryption=none&type=ws&sni=esports.pubgmobile.com#${user}"
vlesslink4="vless://${uuid}@onlinepayment.celcom.com.my:$tls?path=GET-CDN%3Ahttp%3A%2F%2Fonlinepayment.celcom.com.my%2Fxray-vlessws-tls&sni=onlinepayment.celcom.com.my&host=${domain}&security=tls&encryption=none&type=ws&sni=onlinepayment.celcom.com.my#${user}"
vlesslink5="vless://${uuid}@162.159.134.61:$none?path=/xray-vlessws-none-tls&encryption=none&host=${domain}&type=ws#${user}"
vlesslink6="vless://${uuid}@api.useinsider.com:$none?path=/digiapn&encryption=none&host=${domain}&type=ws#${user}"
vlesslink7="vless://${uuid}@eurohealthobservatory.who.int:$none?path=/yesnosub&encryption=none&host=cdn.who.int.${domain}&type=ws#${user}"
vlesslink8="vless://${uuid}@${sts}${MYIP}:$tls?path=/xray-vlessws-tls&security=tls&encryption=none&type=ws&sni=maingame.com.my#${user}"
vlesslink9="vless://${uuid}@${sts}${MYIP}:$tls?path=/xray-vlessws-tls&security=tls&encryption=none&type=ws&sni=mm.net.my#${user}"
vlesslink10="vless://${uuid}@${sts}${MYIP}:$tls?path=/xray-vlessws-tls&security=tls&encryption=none&type=ws&sni=m.erosnow.com#${user}"
vlesslink11="vless://${uuid}@${domain}:$tls?path=/xray-vlessws-tls&security=tls&encryption=none&type=ws&sni=www.pubgmobile.com#${user}"
vlesslink12="vless://${uuid}@${domain}:$tls?path=/xray-vlessws-tls&sni=play.mobilelegends.com&host=play.mobilelegends.com&security=tls&encryption=none&type=ws&sni=play.mobilelegends.com#${user}"
vlesslink13="vless://${uuid}@www.speedtest.net:$none?path=/allbypass&encryption=none&host=${domain}&type=ws#${user}"
vlesslink14="vless://${uuid}@${domain}:$tls?path=/xray-vlessws-tls&security=tls&encryption=none&type=ws&sni=ecommerce.unifi.com.my#${user}"
vlesslink15="vless://${uuid}@api-faceid.maxis.com.my.${domain}:$tls?path=/xray-vlessws-tls&host=${domain}&security=tls&encryption=none&type=ws&sni=www.mosti.gov.my#${user}"
clear
echo -e ""
echo -e "\e[$line═════════[XRAY VLESS WS]═════════\e[m"
echo -e "☑️Remarks          : ${user}"
echo -e "☑️Created          : $harini"
echo -e "☑️Expired           : $exp"
echo -e "☑️Domain           : ${domain}"
echo -e "☑️IP/Host          : $MYIP"
echo -e "☑️Port TLS         : $tls"
echo -e "☑️Port None TLS    : $none"
echo -e "☑️User ID          : ${uuid}"
echo -e "☑️Encryption       : None"
echo -e "☑️Network          : WebSocket"
echo -e "☑️Path Tls         : $patchtls"
echo -e "☑️Path None Tls    : $patchnontls"
echo -e "☑️AllowInsecure    : True/Allow"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Pantang Larang $creditt Shop"
echo -e "‼️Aktiviti Berikut Adalah Dilarang(ID akan di ban tanpa notis & tiada refund)"
echo -e "\e[31m🚫 Torrent (p2p, streaming p2p)"
echo -e "\e[31m🚫 PS4"
echo -e "\e[31m🚫 Porn"
echo -e "\e[31m🚫 Spam Bug"
echo -e "\e[31m🚫 Ddos Server"
echo -e "\e[31m🚫 Mining Bitcoins"
echo -e "\e[31m🚫 Abuse Usage"
echo -e "\e[31m🚫 Multi-Login ID"
echo -e "\e[31m🚫 Sharing Premium Config\e[m"
echo -e "\e[$line════════════════════════\e[m"
echo -e " ❤️™️ MAXIS HUNT IP-1™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink1}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "❤️™️ MAXIS HUNT IP-2 ™️ " 
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink2}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "❤️™️ MAXIS TV ™️" 
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink3}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "💙 ™️ CELCOM TANPA LANGGAN ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink4}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "💛 ™️ DIGI BOOSTER ™️"
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink5}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "💛™️ DIGI APN ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink6}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "💗™️ YESS NO SUB ™️"
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink7}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "🧡™️ UMOBILE NO SUB-1™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink8}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "🧡™️ UMOBILE NO SUB-2 ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink9}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "🧡™️ UMOBILE NO SUB-3 ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink10}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "💚 ™️  PUBG GAME ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink11}"
echo -e "\e[$line═══════════════════════\e[m"
echo -e "🖤 ™️ YOODO ML GAME ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink12}"
echo -e "\e[$line═══════════════════════\e[m"
echo -e "💙💗🧡 ™️ CELCOM/TUNETALK/YODOO
BYPASS SPEED CAPP ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink13}"
echo -e "\e[$line═══════════════════════\e[m"
echo -e "💜 ™️ UNIFI ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink14}"
echo -e "\e[$line═══════════════════════\e[m"
echo -e " ❤️™️ MAXIS UNLIMITED™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink15}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "Created   : $harini"
echo -e "Expired   : $exp"
echo -e "Script By JIEVPN"
}
# TRIAL USER VLESS WS
function menu8 () {
clear
tls="$(cat ~/log-install.txt | grep -w "Vless Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless Ws None Tls" | cut -d: -f2|sed 's/ //g')"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
echo -e   "  \e[$back_text           \e[30m[\e[$box TRIAL USER XRAY VLESS WS TLS\e[30m ]\e[1m            \e[m"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
# Create Expried 
masaaktif="1"
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")

# Make Random Username 
user=Trial`</dev/urandom tr -dc X-Z0-9 | head -c4`

patchtls=/xray-vlessws-tls
patchnontls=/xray-vlessws-none-tls
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "   Bug Address (Example: www.google.com) : " address
read -p "   Bug SNI/Host (Example : m.facebook.com) : " sni
bug_addr=${address}.
bug_addr2=$address
if [[ $address == "" ]]; then
sts=$bug_addr2
else
sts=$bug_addr
fi
harini=`date -d "0 days" +"%Y-%m-%d"`
sed -i '/#xray-vless-tls$/a\#vls '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/config.json
sed -i '/#xray-vless-nontls$/a\#vls '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/none.json
vlesslink1="vless://${uuid}@www.unisza.edu.my.${domain}:$tls?path=/xray-vlessws-tls&sni=mycampus.upnm.edu.my&host=mycampus.upnm.edu.my&security=tls&encryption=none&type=ws&sni=mycampus.upnm.edu.my#${user}"
vlesslink2="vless://${uuid}@www.umk.edu.my.${domain}:$tls?path=/xray-vlessws-tls&sni=smpk.moe.gov.my&host=smpk.moe.gov.my&security=tls&encryption=none&type=ws&sni=smpk.moe.gov.my#${user}"
vlesslink3="vless://${uuid}@live.iqiyi.com.${domain}:$tls?path=/xray-vlessws-tls&sni=esports.pubgmobile.com&host=esports.pubgmobile.com&security=tls&encryption=none&type=ws&sni=esports.pubgmobile.com#${user}"
vlesslink4="vless://${uuid}@onlinepayment.celcom.com.my:$tls?path=GET-CDN%3Ahttp%3A%2F%2Fonlinepayment.celcom.com.my%2Fxray-vlessws-tls&sni=onlinepayment.celcom.com.my&host=${domain}&security=tls&encryption=none&type=ws&sni=onlinepayment.celcom.com.my#${user}"
vlesslink5="vless://${uuid}@162.159.134.61:$none?path=/xray-vlessws-none-tls&encryption=none&host=${domain}&type=ws#${user}"
vlesslink6="vless://${uuid}@api.useinsider.com:$none?path=/digiapn&encryption=none&host=${domain}&type=ws#${user}"
vlesslink7="vless://${uuid}@eurohealthobservatory.who.int:$none?path=/yesnosub&encryption=none&host=cdn.who.int.${domain}&type=ws#${user}"
vlesslink8="vless://${uuid}@${sts}${MYIP}:$tls?path=/xray-vlessws-tls&security=tls&encryption=none&type=ws&sni=maingame.com.my#${user}"
vlesslink9="vless://${uuid}@${sts}${MYIP}:$tls?path=/xray-vlessws-tls&security=tls&encryption=none&type=ws&sni=mm.net.my#${user}"
vlesslink10="vless://${uuid}@${sts}${MYIP}:$tls?path=/xray-vlessws-tls&security=tls&encryption=none&type=ws&sni=m.erosnow.com#${user}"
vlesslink11="vless://${uuid}@${domain}:$tls?path=/xray-vlessws-tls&security=tls&encryption=none&type=ws&sni=www.pubgmobile.com#${user}"
vlesslink12="vless://${uuid}@${domain}:$tls?path=/xray-vlessws-tls&sni=play.mobilelegends.com&host=play.mobilelegends.com&security=tls&encryption=none&type=ws&sni=play.mobilelegends.com#${user}"
vlesslink13="vless://${uuid}@www.speedtest.net:$none?path=/allbypass&encryption=none&host=${domain}&type=ws#${user}"
vlesslink14="vless://${uuid}@${domain}:$tls?path=/xray-vlessws-tls&security=tls&encryption=none&type=ws&sni=ecommerce.unifi.com.my#${user}"
vlesslink15="vless://${uuid}@api-faceid.maxis.com.my.${domain}:$tls?path=/xray-vlessws-tls&host=${domain}&security=tls&encryption=none&type=ws&sni=www.mosti.gov.my#${user}"
clear
echo -e ""
echo -e "\e[$line═════════[XRAY VLESS WS]═════════\e[m"
echo -e "☑️Remarks          : ${user}"
echo -e "☑️Created          : $harini"
echo -e "☑️Expired           : $exp"
echo -e "☑️Domain           : ${domain}"
echo -e "☑️IP/Host          : $MYIP"
echo -e "☑️Port TLS         : $tls"
echo -e "☑️Port None TLS    : $none"
echo -e "☑️User ID          : ${uuid}"
echo -e "☑️Encryption       : None"
echo -e "☑️Network          : WebSocket"
echo -e "☑️Path Tls         : $patchtls"
echo -e "☑️Path None Tls    : $patchnontls"
echo -e "☑️AllowInsecure    : True/Allow"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Pantang Larang $creditt Shop"
echo -e "‼️Aktiviti Berikut Adalah Dilarang(ID akan di ban tanpa notis & tiada refund)"
echo -e "\e[31m🚫 Torrent (p2p, streaming p2p)"
echo -e "\e[31m🚫 PS4"
echo -e "\e[31m🚫 Porn"
echo -e "\e[31m🚫 Spam Bug"
echo -e "\e[31m🚫 Ddos Server"
echo -e "\e[31m🚫 Mining Bitcoins"
echo -e "\e[31m🚫 Abuse Usage"
echo -e "\e[31m🚫 Multi-Login ID"
echo -e "\e[31m🚫 Sharing Premium Config\e[m"
echo -e "\e[$line════════════════════════\e[m"
echo -e " ❤️™️ MAXIS HUNT IP-1™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink1}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "❤️™️ MAXIS HUNT IP-2 ™️ " 
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink2}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "❤️™️ MAXIS TV ™️" 
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink3}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "💙 ™️ CELCOM TANPA LANGGAN ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink4}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "💛 ™️ DIGI BOOSTER ™️"
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink5}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "💛™️ DIGI APN ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink6}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "💗™️ YESS NO SUB ™️"
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink7}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "🧡™️ UMOBILE NO SUB-1™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink8}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "🧡™️ UMOBILE NO SUB-2 ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink9}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "🧡™️ UMOBILE NO SUB-3 ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink10}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "💚 ™️  PUBG GAME ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink11}"
echo -e "\e[$line═══════════════════════\e[m"
echo -e "🖤 ™️ YOODO ML GAME ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink12}"
echo -e "\e[$line═══════════════════════\e[m"
echo -e "💙💗🧡 ™️ CELCOM/TUNETALK/YODOO
BYPASS SPEED CAPP ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink13}"
echo -e "\e[$line═══════════════════════\e[m"
echo -e "💜 ™️ UNIFI ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink14}"
echo -e "\e[$line═══════════════════════\e[m"
echo -e " ❤️™️ MAXIS UNLIMITED™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink15}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "Created   : $harini"
echo -e "Expired   : $exp"
echo -e "Script By JIEVPN"
}
# DELETE USER VLESS WS
function menu9 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vls " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo " Delete User Xray Vless Ws"
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " ==============================="
	echo "     No  Expired   User"
	grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
harini=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^#vls $user $exp $harini $uuid/,/^},{/d" /usr/local/etc/xray/config.json
sed -i "/^#vls $user $exp $harini $uuid/,/^},{/d" /usr/local/etc/xray/none.json
systemctl restart xray
systemctl restart xray@none
clear
echo " Xray Vless Ws Account Deleted Successfully"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp"
echo " =========================="
}
#RENEW VLESS WS
function menu10 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vls " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo "Renew User Xray Vless Ws"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (days): " masaaktif
harini=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/#vls $user $exp $harini $uuid/#vls $user $exp4 $harini $uuid/g" /usr/local/etc/xray/config.json
sed -i "s/#vls $user $exp $harini $uuid/#vls $user $exp4 $harini $uuid/g" /usr/local/etc/xray/none.json
service cron restart
clear
echo ""
echo " VLESS WS Account Was Successfully Renewed"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo " =========================="
}
# show user vless ws
function menu11 () {
clear
tls="$(cat ~/log-install.txt | grep -w "Vless Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless Ws None Tls" | cut -d: -f2|sed 's/ //g')"
NUMBER_OF_CLIENTS=$(grep -c -E "^#vls " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "SHOW USER XRAY VLESS WS"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
patchtls=/xray-vlessws-tls
patchnontls=/xray-vlessws-none-tls
user=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
harini=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
vlesslink1="vless://${uuid}@www.unisza.edu.my.${domain}:$tls?path=/xray-vlessws-tls&sni=mycampus.upnm.edu.my&host=mycampus.upnm.edu.my&security=tls&encryption=none&type=ws&sni=mycampus.upnm.edu.my#${user}"
vlesslink2="vless://${uuid}@www.umk.edu.my.${domain}:$tls?path=/xray-vlessws-tls&sni=smpk.moe.gov.my&host=smpk.moe.gov.my&security=tls&encryption=none&type=ws&sni=smpk.moe.gov.my#${user}"
vlesslink3="vless://${uuid}@live.iqiyi.com.${domain}:$tls?path=/xray-vlessws-tls&sni=esports.pubgmobile.com&host=esports.pubgmobile.com&security=tls&encryption=none&type=ws&sni=esports.pubgmobile.com#${user}"
vlesslink4="vless://${uuid}@onlinepayment.celcom.com.my:$tls?path=GET-CDN%3Ahttp%3A%2F%2Fonlinepayment.celcom.com.my%2Fxray-vlessws-tls&sni=onlinepayment.celcom.com.my&host=${domain}&security=tls&encryption=none&type=ws&sni=onlinepayment.celcom.com.my#${user}"
vlesslink5="vless://${uuid}@162.159.134.61:$none?path=/xray-vlessws-none-tls&encryption=none&host=${domain}&type=ws#${user}"
vlesslink6="vless://${uuid}@api.useinsider.com:$none?path=/digiapn&encryption=none&host=${domain}&type=ws#${user}"
vlesslink7="vless://${uuid}@eurohealthobservatory.who.int:$none?path=/yesnosub&encryption=none&host=cdn.who.int.${domain}&type=ws#${user}"
vlesslink8="vless://${uuid}@${sts}${MYIP}:$tls?path=/xray-vlessws-tls&security=tls&encryption=none&type=ws&sni=maingame.com.my#${user}"
vlesslink9="vless://${uuid}@${sts}${MYIP}:$tls?path=/xray-vlessws-tls&security=tls&encryption=none&type=ws&sni=mm.net.my#${user}"
vlesslink10="vless://${uuid}@${sts}${MYIP}:$tls?path=/xray-vlessws-tls&security=tls&encryption=none&type=ws&sni=m.erosnow.com#${user}"
vlesslink11="vless://${uuid}@${domain}:$tls?path=/xray-vlessws-tls&security=tls&encryption=none&type=ws&sni=www.pubgmobile.com#${user}"
vlesslink12="vless://${uuid}@${domain}:$tls?path=/xray-vlessws-tls&sni=play.mobilelegends.com&host=play.mobilelegends.com&security=tls&encryption=none&type=ws&sni=play.mobilelegends.com#${user}"
vlesslink13="vless://${uuid}@www.speedtest.net:$none?path=/allbypass&encryption=none&host=${domain}&type=ws#${user}"
vlesslink14="vless://${uuid}@${domain}:$tls?path=/xray-vlessws-tls&security=tls&encryption=none&type=ws&sni=ecommerce.unifi.com.my#${user}"
vlesslink15="vless://${uuid}@api-faceid.maxis.com.my.${domain}:$tls?path=/xray-vlessws-tls&host=${domain}&security=tls&encryption=none&type=ws&sni=www.mosti.gov.my#${user}"
clear
echo -e ""
echo -e "\e[$line═════════[XRAY VLESS WS]═════════\e[m"
echo -e "☑️Remarks          : ${user}"
echo -e "☑️Created          : $harini"
echo -e "☑️Expired           : $exp"
echo -e "☑️Domain           : ${domain}"
echo -e "☑️IP/Host          : $MYIP"
echo -e "☑️Port TLS         : $tls"
echo -e "☑️Port None TLS    : $none"
echo -e "☑️User ID          : ${uuid}"
echo -e "☑️Encryption       : None"
echo -e "☑️Network          : WebSocket"
echo -e "☑️Path Tls         : $patchtls"
echo -e "☑️Path None Tls    : $patchnontls"
echo -e "☑️AllowInsecure    : True/Allow"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Pantang Larang $creditt Shop"
echo -e "‼️Aktiviti Berikut Adalah Dilarang(ID akan di ban tanpa notis & tiada refund)"
echo -e "\e[31m🚫 Torrent (p2p, streaming p2p)"
echo -e "\e[31m🚫 PS4"
echo -e "\e[31m🚫 Porn"
echo -e "\e[31m🚫 Spam Bug"
echo -e "\e[31m🚫 Ddos Server"
echo -e "\e[31m🚫 Mining Bitcoins"
echo -e "\e[31m🚫 Abuse Usage"
echo -e "\e[31m🚫 Multi-Login ID"
echo -e "\e[31m🚫 Sharing Premium Config\e[m"
echo -e "\e[$line════════════════════════\e[m"
echo -e " ❤️™️ MAXIS HUNT IP-1™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink1}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "❤️™️ MAXIS HUNT IP-2 ™️ " 
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink2}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "❤️™️ MAXIS TV ™️" 
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink3}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "💙 ™️ CELCOM TANPA LANGGAN ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink4}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "💛 ™️ DIGI BOOSTER ™️"
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink5}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "💛™️ DIGI APN ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink6}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "💗™️ YESS NO SUB ™️"
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink7}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "🧡™️ UMOBILE NO SUB-1™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink8}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "🧡™️ UMOBILE NO SUB-2 ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink9}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "🧡™️ UMOBILE NO SUB-3 ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink10}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "💚 ™️  PUBG GAME ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink11}"
echo -e "\e[$line═══════════════════════\e[m"
echo -e "🖤 ™️ YOODO ML GAME ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink12}"
echo -e "\e[$line═══════════════════════\e[m"
echo -e "💙💗🧡 ™️ CELCOM/TUNETALK/YODOO
BYPASS SPEED CAPP ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink13}"
echo -e "\e[$line═══════════════════════\e[m"
echo -e "💜 ™️ UNIFI ™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink14}"
echo -e "\e[$line═══════════════════════\e[m"
echo -e " ❤️™️ MAXIS UNLIMITED™️ "
echo -e "\e[$line════════════════════════\e[m"
echo     " ${vlesslink15}"
echo -e "\e[$line════════════════════════\e[m"
echo -e "Created   : $harini"
echo -e "Expired   : $exp"
echo -e "Script By JIEVPN"
}
# USER LOGIN VLESS WS
function menu12 () {
clear
echo -n > /tmp/other.txt
data=( `cat /usr/local/etc/xray/config.json | grep '^#vls' | cut -d ' ' -f 2`);
echo "-----------------------------------------";
echo "------=[ Xray Vless Ws User Login ]=-----";
echo "-----------------------------------------";
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/ipvless.txt
data2=( `netstat -anp | grep ESTABLISHED | grep tcp6 | grep xray | awk '{print $5}' | cut -d: -f1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access.log | grep -w $akun | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipvless.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipvless.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipvless.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipvless.txt | nl)
echo "user : $akun";
echo "$jum2";
echo ""
echo "-------------------------------"
fi
rm -rf /tmp/ipvmess.txt
done
}
# CREATE USER VLESS XTLS
function menu13 () {
clear
xtls="$(cat ~/log-install.txt | grep -w "Vless Tcp Xtls" | cut -d: -f2|sed 's/ //g')"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
echo -e   "  \e[$back_text            \e[30m[\e[$box CREATE USER XRAY VLESS XTLS\e[30m ]\e[1m            \e[m"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "   Username: " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "   Bug Address (Example: www.google.com) : " address
read -p "   Bug SNI/Host (Example : m.facebook.com) : " sni
read -p "   Expired (days) : " masaaktif
bug_addr=${address}.
bug_addr2=$address
if [[ $address == "" ]]; then
sts=$bug_addr2
else
sts=$bug_addr
fi
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
harini=`date -d "0 days" +"%Y-%m-%d"`
sed -i '/#xray-vless-xtls$/a\#vxtls '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","flow": "'""xtls-rprx-direct""'","level": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/config.json
vlesslink1="vless://${uuid}@${sts}${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=$sni#${user}"
vlesslink2="vless://${uuid}@${sts}${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=$sni#${user}"
systemctl restart xray
clear
echo -e ""
echo -e "\e[$line════════[XRAY VLESS XTLS]════════\e[m"
echo -e "☢️Remarks        : ${user}"
echo -e "☢️Created         : $harini"
echo -e "☢️Expired         : $exp"
echo -e "☢️Domain         : ${domain}"
echo -e "☢️Ip/Host        : ${MYIP}"
echo -e "☢️Port Xtls      : $xtls"
echo -e "☢️User ID        : ${uuid}"
echo -e "☢️Encryption     : None"
echo -e "☢️Network        : TCP"
echo -e "☢️Flow           : Direct & Splice"
echo -e "☢️AllowInsecure  : True"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Pantang Larang $creditt Shop"
echo -e "‼️Aktiviti Berikut Adalah Dilarang(ID akan di ban tanpa notis & tiada refund)"
echo -e "\e[31m❌ Torrent (p2p, streaming p2p)"
echo -e "\e[31m❌ PS4"
echo -e "\e[31m❌ Porn"
echo -e "\e[31m❌ Spam Bug"
echo -e "\e[31m❌ Ddos Server"
echo -e "\e[31m❌ Mining Bitcoins"
echo -e "\e[31m❌ Abuse Usage"
echo -e "\e[31m❌ Multi-Login ID"
echo -e "\e[31m❌ Sharing Premium Config\e[m"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link Xtls Direct  : ${vlesslink1}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link Xtls Splice  : ${vlesslink2}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created  : $harini"
echo -e "Expired  : $exp"
echo -e "Script By $creditt"
}
# TRIAL USER VLESS XTLS
function menu14 () {
clear
xtls="$(cat ~/log-install.txt | grep -w "Vless Tcp Xtls" | cut -d: -f2|sed 's/ //g')"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
echo -e   "  \e[$back_text            \e[30m[\e[$box TRIAL USER XRAY VLESS XTLS\e[30m ]\e[1m             \e[m"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
# Create Expried 
masaaktif="1"
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")

# Make Random Username 
user=Trial`</dev/urandom tr -dc X-Z0-9 | head -c4`

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "   Bug Address (Example: www.google.com) : " address
read -p "   Bug SNI/Host (Example : m.facebook.com) : " sni
bug_addr=${address}.
bug_addr2=$address
if [[ $address == "" ]]; then
sts=$bug_addr2
else
sts=$bug_addr
fi
harini=`date -d "0 days" +"%Y-%m-%d"`
sed -i '/#xray-vless-xtls$/a\#vxtls '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","flow": "'""xtls-rprx-direct""'","level": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/config.json
vlesslink1="vless://${uuid}@${sts}${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=$sni#${user}"
vlesslink2="vless://${uuid}@${sts}${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=$sni#${user}"
systemctl restart xray
clear
echo -e ""
echo -e "\e[$line═════[TRIAL XRAY VLESS XTLS]═════\e[m"
echo -e "☢️Remarks        : ${user}"
echo -e "☢️Created         : $harini"
echo -e "☢️Expired         : $exp"
echo -e "☢️Domain         : ${domain}"
echo -e "☢️Ip/Host        : ${MYIP}"
echo -e "☢️Port Xtls      : $xtls"
echo -e "☢️User ID        : ${uuid}"
echo -e "☢️Encryption     : None"
echo -e "☢️Network        : TCP"
echo -e "☢️Flow           : Direct & Splice"
echo -e "☢️AllowInsecure  : True"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Pantang Larang $creditt Shop"
echo -e "‼️Aktiviti Berikut Adalah Dilarang(ID akan di ban tanpa notis & tiada refund)"
echo -e "\e[31m❌ Torrent (p2p, streaming p2p)"
echo -e "\e[31m❌ PS4"
echo -e "\e[31m❌ Porn"
echo -e "\e[31m❌ Spam Bug"
echo -e "\e[31m❌ Ddos Server"
echo -e "\e[31m❌ Mining Bitcoins"
echo -e "\e[31m❌ Abuse Usage"
echo -e "\e[31m❌ Multi-Login ID"
echo -e "\e[31m❌ Sharing Premium Config\e[m"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link Xtls Direct  : ${vlesslink1}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link Xtls Splice  : ${vlesslink2}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created  : $harini"
echo -e "Expired  : $exp"
echo -e "Script By $creditt"
}
# DELETE VLESS XTLS
function menu15 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vxtls " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo " Delete User Xray Vless Tcp Xtls"
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " ==============================="
	echo "     No  Expired   User"
	grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
harini=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^#vxtls $user $exp $harini $uuid/,/^},{/d" /usr/local/etc/xray/config.json
systemctl restart xray
clear
echo " Xray Vless Tcp Xtls Account Deleted Successfully"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp"
echo " =========================="
}
# RENEW VLESS XTLS
function menu16 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vxtls " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "Renew User Xray Vless Tcp Xtls"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (days): " masaaktif
harini=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/#vxtls $user $exp $harini $uuid/#vxtls $user $exp4 $harini $uuid/g" /usr/local/etc/xray/config.json
service cron restart
clear
echo ""
echo " Xray Vless Tcp Xtls Account Was Successfully Renewed"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo " =========================="
}
#SHOW VLESS XTLS
function menu17 () {
clear
xtls="$(cat ~/log-install.txt | grep -w "Vless Tcp Xtls" | cut -d: -f2|sed 's/ //g')"
NUMBER_OF_CLIENTS=$(grep -c -E "^#vxtls " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "SHOW USER XRAY VLESS XTLS"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
harini=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
vlesslink1="vless://${uuid}@${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=bug.com#${user}"
vlesslink2="vless://${uuid}@${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=bug.com#${user}"
clear
echo -e ""
echo -e "\e[$line════════[XRAY VLESS XTLS]════════\e[m"
echo -e "☢️Remarks          : ${user}"
echo -e "☢️Created         : $harini"
echo -e "☢️Expired         : $exp"
echo -e "☢️Domain           : ${domain}"
echo -e "☢️Ip/Host          : ${MYIP}"
echo -e "☢️Port Xtls        : $xtls"
echo -e "☢️User ID          : ${uuid}"
echo -e "☢️Encryption       : None"
echo -e "☢️Network          : TCP"
echo -e "☢️Flow             : Direct & Splice"
echo -e "☢️AllowInsecure    : True"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Pantang Larang $creditt Shop"
echo -e "‼️Aktiviti Berikut Adalah Dilarang(ID akan di ban tanpa notis & tiada refund)"
echo -e "\e[31m❌ Torrent (p2p, streaming p2p)"
echo -e "\e[31m❌ PS4"
echo -e "\e[31m❌ Porn"
echo -e "\e[31m❌ Spam Bug"
echo -e "\e[31m❌ Ddos Server"
echo -e "\e[31m❌ Mining Bitcoins"
echo -e "\e[31m❌ Abuse Usage"
echo -e "\e[31m❌ Multi-Login ID"
echo -e "\e[31m❌ Sharing Premium Config\e[m"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link Xtls Direct : ${vlesslink1}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link Xtls Splice : ${vlesslink2}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created    : $harini"
echo -e "Expired    : $exp"
echo -e "Script By $creditt"
}
# CEK USER LOGIN VLESS XTLS
function menu18 () {
clear
echo -n > /tmp/other.txt
data=( `cat /usr/local/etc/xray/config.json | grep '^#vxtls' | cut -d ' ' -f 2`);
echo "------------------------------------------";
echo "-----=[ Xray Vless Xtls User Login ]=-----";
echo "----------=[  Direct & Splice ]=----------";
echo "------------------------------------------";
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/ipxray.txt
data2=( `netstat -anp | grep ESTABLISHED | grep tcp6 | grep xray | awk '{print $5}' | cut -d: -f1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access.log | grep -w $akun | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipxray.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipxray.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipxray.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipxray.txt | nl)
echo "user : $akun";
echo "$jum2";
echo ""
echo "-------------------------------"
fi
rm -rf /tmp/ipxray.txt
done
}
# FUCTION CREATE USER TROJAN
function menu19 () {
clear
trnone="$(cat ~/log-install.txt | grep -w "Xray Trojan Ws None Tls" | cut -d: -f2|sed 's/ //g')"
trws="$(cat ~/log-install.txt | grep -w "Xray Trojan Ws Tls" | cut -d: -f2|sed 's/ //g')"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
echo -e   "  \e[$back_text          \e[30m[\e[$box CREATE USER XRAY TROJAN WS TLS\e[30m ]\e[1m          \e[m"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "   Password: " -e user
		user_EXISTS=$(grep -w $user /usr/local/etc/xray/trojan.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
patchtls=/nevermore-trojanwstls
patchnone=/nevermore-trojanwsntls
read -p "   Bug Address (Example: www.google.com) : " address
read -p "   Bug SNI (Example : m.facebook.com) : " sni
read -p "   Expired (days) : " masaaktif
bug_addr=${address}.
bug_addr2=$address
if [[ $address == "" ]]; then
sts=$bug_addr2
else
sts=$bug_addr
fi
harini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-trojan-tls$/a\#trws '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","password": "'""$user""'","email": "'""$user""'"' /usr/local/etc/xray/trojan.json
sed -i '/#xray-trojan-nontls$/a\#trws '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","password": "'""$user""'","email": "'""$user""'"' /usr/local/etc/xray/trojannone.json
systemctl restart xray@trojan
systemctl restart xray@trojannone
trojanlink1="trojan://${user}@ufuture.uitm.edu.my:443?path=CF-RAY:http://ufuture.uitm.edu.my$patchtls&security=tls&host=${sts}${domain}&type=ws&sni=ufuture.uitm.edu.my#${user}"
trojanlink2="trojan://${user}@onlinepayment.celcom.com.my:443?path=CF-RAY:http://onlinepayment.celcom.com.my$patchtls&security=tls&host=${sts}${domain}&type=ws&sni=onlinepayment.celcom.com.my#${user}"
trojanlink3="trojan://${user}@www.who.int:80?path=CF-RAY:http://www.who.int$patchnone&security=none&host=${sts}${domain}&type=ws#${user}"
trojanlink4="trojan://${user}@api.useinsider.com:80?path=$patchnone&security=none&host=${sts}${domain}&type=ws#${user}"
trojanlink3="trojan://${user}@www.who.int:80?path=CF-RAY:http://www.who.int$patchnone&security=none&host=${sts}${domain}&type=ws#${user}"
trojanlink4="trojan://${user}@api.useinsider.com:80?path=$patchnone&security=none&host=${sts}${domain}&type=ws#${user}"
clear
echo -e ""
echo -e "\e[$line════════[XRAY TROJAN WS TLS]════════\e[m"
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "IP/Host        : ${MYIP}"
echo -e "Port Tls       : ${trws}"
echo -e "Port None TLS  : ${trnone}"
echo -e "Key            : ${user}"
echo -e "Security       : Auto"
echo -e "Network        : Websocket"
echo -e "Path Tls       : $patchtls"
echo -e "Path None Tls  : $patchnone"
echo -e "allowInsecure  : True/allow"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Script By $creditt"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Maxis)    : ${trojanlink1}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Celcom)   : ${trojanlink2}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Yes)      : ${trojanlink3}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Digi)     : ${trojanlink4}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created   :$harini"
echo -e "Expired   :$exp"
echo ""
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
xraay
}
# FUCTION TRIAL USER TROJAN
function menu20 () {
clear
trnone="$(cat ~/log-install.txt | grep -w "Xray Trojan Ws None Tls" | cut -d: -f2|sed 's/ //g')"
trws="$(cat ~/log-install.txt | grep -w "Xray Trojan Ws Tls" | cut -d: -f2|sed 's/ //g')"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
echo -e   "  \e[$back_text          \e[30m[\e[$box TRIAL USER XRAY TROJAN WS TLS\e[30m ]\e[1m           \e[m"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
# Create Expried 
masaaktif="1"
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")

# Make Random Username 
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`

patchtls=/nevermore-trojanwstls
patchnone=/nevermore-trojanwsntls
read -p "   Bug Address (Example: www.google.com) : " address
read -p "   Bug SNI (Example : m.facebook.com) : " sni
bug_addr=${address}.
bug_addr2=$address
if [[ $address == "" ]]; then
sts=$bug_addr2
else
sts=$bug_addr
fi
harini=`date -d "0 days" +"%Y-%m-%d"`
sed -i '/#xray-trojan-tls$/a\#trws '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","password": "'""$user""'","email": "'""$user""'"' /usr/local/etc/xray/trojan.json
sed -i '/#xray-trojan-nontls$/a\#trws '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","password": "'""$user""'","email": "'""$user""'"' /usr/local/etc/xray/trojannone.json
systemctl restart xray@trojan
systemctl restart xray@trojannone
trojanlink1="trojan://${user}@ufuture.uitm.edu.my:443?path=CF-RAY:http://ufuture.uitm.edu.my$patchtls&security=tls&host=${sts}${domain}&type=ws&sni=ufuture.uitm.edu.my#${user}"
trojanlink2="trojan://${user}@onlinepayment.celcom.com.my:443?path=CF-RAY:http://onlinepayment.celcom.com.my$patchtls&security=tls&host=${sts}${domain}&type=ws&sni=onlinepayment.celcom.com.my#${user}"
trojanlink3="trojan://${user}@www.who.int:80?path=CF-RAY:http://www.who.int$patchnone&security=none&host=${sts}${domain}&type=ws#${user}"
trojanlink4="trojan://${user}@api.useinsider.com:80?path=$patchnone&security=none&host=${sts}${domain}&type=ws#${user}"
clear
echo -e ""
echo -e "\e[$line═════[TRIAL XRAY TROJAN WS TLS]═════\e[m"
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "IP/Host        : ${MYIP}"
echo -e "Port Tls       : ${trws}"
echo -e "Port None TLS  : ${trnone}"
echo -e "Key            : ${user}"
echo -e "Security       : Auto"
echo -e "Network        : Websocket"
echo -e "Path Tls       : $patchtls"
echo -e "Path None Tls  : $patchnone"
echo -e "allowInsecure  : True/allow"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Script By $creditt"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Maxis)    : ${trojanlink1}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Celcom)   : ${trojanlink2}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Yes)      : ${trojanlink3}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Digi)     : ${trojanlink4}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created   :$harini"
echo -e "Expired   :$exp"
echo ""
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
xraay
}
function menu21 () {
trnone="$(cat ~/log-install.txt | grep -w "Xray Trojan Ws None Tls" | cut -d: -f2|sed 's/ //g')"
trws="$(cat ~/log-install.txt | grep -w "Xray Trojan Ws Tls" | cut -d: -f2|sed 's/ //g')"
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#trws " "/usr/local/etc/xray/trojan.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "SHOW USER XRAY TROJAN WS TLS"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^#trws " "/usr/local/etc/xray/trojan.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
patchtls=/nevermore-trojanwstls
patchnone=/nevermore-trojanwsntls
user=$(grep -E "^#trws " "/usr/local/etc/xray/trojan.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
harini=$(grep -E "^#trws " "/usr/local/etc/xray/trojan.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#trws " "/usr/local/etc/xray/trojan.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^#trws " "/usr/local/etc/xray/trojan.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
trojanlink1="trojan://${user}@ufuture.uitm.edu.my:443?path=CF-RAY:http://ufuture.uitm.edu.my$patchtls&security=tls&host=${sts}${domain}&type=ws&sni=ufuture.uitm.edu.my#${user}"
trojanlink2="trojan://${user}@onlinepayment.celcom.com.my:443?path=CF-RAY:http://onlinepayment.celcom.com.my$patchtls&security=tls&host=${sts}${domain}&type=ws&sni=onlinepayment.celcom.com.my#${user}"
trojanlink3="trojan://${user}@www.who.int:80?path=CF-RAY:http://www.who.int$patchnone&security=none&host=${sts}${domain}&type=ws#${user}"
trojanlink4="trojan://${user}@api.useinsider.com:80?path=$patchnone&security=none&host=${sts}${domain}&type=ws#${user}"
clear
echo -e ""
echo -e "\e[$line════════[XRAY TROJAN WS TLS]════════\e[m"
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "IP/Host        : ${MYIP}"
echo -e "Port Tls       : ${trws}"
echo -e "Port None TLS  : ${trnone}"
echo -e "Key            : ${user}"
echo -e "Security       : Auto"
echo -e "Network        : Websocket"
echo -e "Path Tls       : $patchtls"
echo -e "Path None Tls  : $patchnone"
echo -e "allowInsecure  : True/allow"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Script By $creditt"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Maxis)    : ${trojanlink1}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Celcom)   : ${trojanlink2}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Yes)      : ${trojanlink3}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link (Digi)     : ${trojanlink4}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created   :$harini"
echo -e "Expired   :$exp"
echo ""
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
xraay
}
# MENU XRAY VMESS VLESS TROJAN MAXIS DIGI YES CELCOM
clear
echo -e ""
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "   \e[$back_text   \e[30m═[\e[$box PANEL XRAY VMESS WEBSOCKET TLS\e[30m ]═   \e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "    \e[$number (•1)\e[m \e[$below ✍️Create Vmess Websocket Account\e[m"
echo -e "    \e[$number (•2)\e[m \e[$below ✍️Trial User Vmess Websocket\e[m"
echo -e "    \e[$number (•3)\e[m \e[$below ❌Delete Vmess Websocket Account\e[m"
echo -e "    \e[$number (•4)\e[m \e[$below 🔁Renew Vmess Websocket Account\e[m"
echo -e "    \e[$number (•5)\e[m \e[$below 🎞️Show Config Vmess Account\e[m"
echo -e "    \e[$number (•6)\e[m \e[$below 🖥️Check User Login Vmess\e[m"
echo -e ""
echo -e "   \e[$number    >> Total :\e[m \e[$below ${total1} Client\e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "   \e[$back_text   \e[30m═[\e[$box PANEL XRAY VLESS WEBSOCKET TLS\e[30m ]═   \e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "    \e[$number (•7)\e[m \e[$below ✍️Create Vless Websocket Account\e[m"
echo -e "    \e[$number (•8)\e[m \e[$below ✍️Trial User Vless Websocket\e[m"
echo -e "    \e[$number (•9)\e[m \e[$below ❌Deleting Vless Websocket Account\e[m"
echo -e "    \e[$number (10)\e[m \e[$below 🔁Renew Vless Websocket Account\e[m"
echo -e "    \e[$number (11)\e[m \e[$below 🎞️Show Config Vless Account\e[m"
echo -e "    \e[$number (12)\e[m \e[$below 🖥️Check User Login Vless\e[m"
echo -e ""
echo -e "   \e[$number    >> Total :\e[m \e[$below ${total2} Client\e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "   \e[$back_text\e[30m═[\e[$box XRAY VLESS TCP XTLS(Direct & Splice)\e[30m ]═\e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "    \e[$number (13)\e[m \e[$below ✍️Create Xray VLess Xtls Account\e[m"
echo -e "    \e[$number (14)\e[m \e[$below ✍️Trial User Vless Xtls\e[m"
echo -e "    \e[$number (15)\e[m \e[$below 🔓Deleting Xray Vless Xtls Account\e[m"
echo -e "    \e[$number (16)\e[m \e[$below 🔁Renew Xray Vless Xtls Account\e[m"
echo -e "    \e[$number (17)\e[m \e[$below 🎞️Show Config Vless Xtls Account\e[m"
echo -e "    \e[$number (18)\e[m \e[$below 🖥️Check User Login Vless Xtls\e[m"
echo -e ""
echo -e "   \e[$number    >> Total :\e[m \e[$below ${total3} Client\e[m"
echo -e "   \e[$line ══════════════════════════════════════════\e[m"
echo -e "    \e[$back_text       \e[30m[\e[$box TROJAN MAXIS & DIGI CELCOM\e ]\e[30m      \e[m"
echo -e "   \e[$line ══════════════════════════════════════════\e[m"
echo -e "    \e[$number (19)\e[m \e[$below XRAY TROJAN MAXIS DIGI CELCOM YES UMOBILE\e[m"
echo -e "    \e[$number (20)\e[m \e[$below XRAY TROJAN TRIAL MAXIS DIGI CELCOM YES UMOBILE\e[m"
echo -e "    \e[$number (21)\e[m \e[$below XRAY TROJAN CONFIQ VLESS MAXIS DIGI CELCOM YES UMOBILE\e[m"
echo -e ""
echo -e "   \e[$number    >> Total :\e[m \e[$below ${total4} Client\e[m"
echo -e "   \e[$line ══════════════════════════════════════════\e[m"
echo -e "    \e[$back_text  \e[$box x)   MENU                              \e[m"
echo -e "   \e[$line ══════════════════════════════════════════\e[m"
echo -e "\e[$line"
read -rp "        Please Input Number  [1-18 or x] :  "  num
echo -e ""
if [[ "$num" = "1" ]]; then
menu1
elif [[ "$num" = "2" ]]; then
menu2
elif [[ "$num" = "3" ]]; then
menu3
elif [[ "$num" = "4" ]]; then
menu4
elif [[ "$num" = "5" ]]; then
menu5
elif [[ "$num" = "6" ]]; then
menu6
elif [[ "$num" = "7" ]]; then
menu7
elif [[ "$num" = "8" ]]; then
menu8
elif [[ "$num" = "9" ]]; then
menu9
elif [[ "$num" = "10" ]]; then
menu10
elif [[ "$num" = "11" ]]; then
menu11
elif [[ "$num" = "12" ]]; then
menu12
elif [[ "$num" = "13" ]]; then
menu13
elif [[ "$num" = "14" ]]; then
menu14
elif [[ "$num" = "15" ]]; then
menu15
elif [[ "$num" = "16" ]]; then
menu16
elif [[ "$num" = "17" ]]; then
menu17
elif [[ "$num" = "18" ]]; then
menu18
elif [[ "$num" = "19" ]]; then
menu19
elif [[ "$num" = "20" ]]; then
menu20
elif [[ "$num" = "21" ]]; then
menu21
elif [[ "$num" = "x" ]]; then
menu
else
clear
echo -e "\e[1;31mYou Entered The Wrong Number, Please Try Again!\e[0m"
sleep 1
xraay
fi
