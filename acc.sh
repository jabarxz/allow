#wget https://github.com/${GitUser}/
GitUser="aziziangah92"
# Color Validation
Lred='\e[1;91m'
BGWHITE='\e[0;47;30m'
NC='\033[0m'
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
# Valid Script
VALIDITY () {
    today=`date -d "0 days" +"%Y-%m-%d"`
    Exp1=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $4}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mYOUR SCRIPT ACTIVE..\e[0m"
    else
    echo -e "\e[31mYOUR SCRIPT HAS EXPIRED!\e[0m";
    echo -e "\e[31mPlease renew your ipvps first\e[0m"
    exit 0
fi
}
IZIN=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | awk '{print $5}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
VALIDITY
else
echo -e "\e[31mPermission Denied!\e[0m";
echo -e "\e[31mPlease buy script first\e[0m"
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
total1=$(grep -c -E "^#vms " "/usr/local/etc/xray/vmess.json")
# TOTAL ACC CREATE  VLESS WS
total2=$(grep -c -E "^#vls " "/usr/local/etc/xray/vless.json")
# TOTAL ACC CREATE  TROJAN WS TLS
total3=$(grep -c -E "^#trws " "/usr/local/etc/xray/trojan.json")
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
echo -e "\e[$line══════════════════════════════════════════════════════════════════${NC}"
echo -e "\e[$back_text                         \e[30m[\e[$box XRAY VMESS WS\e[30m]                         \e[m"
echo -e "\e[$line══════════════════════════════════════════════════════════════════${NC}"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "   Username: " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/vmess.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
patchtls=/nevermore-vmesswstls
patchnontls=/nevermore-vmesswsntls
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
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/vmess.json
sed -i '/#xray-vmess-nontls$/a\#vms '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/vmessnone.json
cat>/usr/local/etc/xray/$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "ufuture.uitm.edu.my",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "CF-RAY:http://ufuture.uitm.edu.my$patchtls",
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
      "path": "CF-RAY:http://onlinepayment.celcom.com.my$patchtls",
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
      "path": "CF-RAY:http://www.who.int$patchnontls",
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
echo -e "\e[$line══════════════════════════════════════════════════════════════════${NC}"
echo -e "\e[$back_text                         \e[30m[\e[$box XRAY VMESS WS\e[30m]                         \e[m"
echo -e "\e[$line══════════════════════════════════════════════════════════════════${NC}"
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "IP/Host        : $MYIP"
echo -e "Port TLS       : ${tls}"
echo -e "Port None TLS  : ${none}"
echo -e "User ID        : ${uuid}"
echo -e "Security       : Auto"
echo -e "Network        : Websocket"
echo -e "Path Tls       : $patchtls"
echo -e "Path None Tls  : $patchnontls"
echo -e "allowInsecure  : True/allow"
echo -e "Support Yaml   : YES"
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
echo ""
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
xraay
}
# TRIAL USER
function menu2 () {
clear
tls="$(cat ~/log-install.txt | grep -w "Vmess Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess Ws None Tls" | cut -d: -f2|sed 's/ //g')"
echo -e " ${Lred}══════════════════════════════════════════════════════════════════${NC}"
echo -e " ${BGWHITE}                     [ TRIAL XRAY VMESS WS ]                      ${NC}"
echo -e " ${Lred}══════════════════════════════════════════════════════════════════${NC}"
# Create Expried 
masaaktif="1"
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")

# Make Random Username 
user=Trial`</dev/urandom tr -dc X-Z0-9 | head -c4`

patchtls=/nevermore-vmesswstls
patchnontls=/nevermore-vmesswsntls
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
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/vmess.json
sed -i '/#xray-vmess-nontls$/a\#vms '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/vmessnone.json
cat>/usr/local/etc/xray/$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "ufuture.uitm.edu.my",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "CF-RAY:http://ufuture.uitm.edu.my$patchtls",
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
      "path": "CF-RAY:http://onlinepayment.celcom.com.my$patchtls",
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
      "path": "CF-RAY:http://www.who.int$patchnontls",
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
echo -e " ${Lred}══════════════════════════════════════════════════════════════════${NC}"
echo -e " ${BGWHITE}                     [ TRIAL XRAY VMESS WS ]                      ${NC}"
echo -e " ${Lred}══════════════════════════════════════════════════════════════════${NC}"
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "IP/Host        : $MYIP"
echo -e "Port TLS       : ${tls}"
echo -e "Port None TLS  : ${none}"
echo -e "User ID        : ${uuid}"
echo -e "Security       : Auto"
echo -e "Network        : Websocket"
echo -e "Path Tls       : $patchtls"
echo -e "Path None Tls  : $patchnontls"
echo -e "allowInsecure  : True/allow"
echo -e "Support Yaml   : YES"
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
echo ""
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
xraay
}
# show user
function menu3 () {
clear
tls="$(cat ~/log-install.txt | grep -w "Vmess Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess Ws None Tls" | cut -d: -f2|sed 's/ //g')"
NUMBER_OF_CLIENTS=$(grep -c -E "^#vms " "/usr/local/etc/xray/vmess.json")
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
	grep -E "^#vms " "/usr/local/etc/xray/vmess.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
patchtls=/nevermore-vmesswstls
patchnontls=/nevermore-vmesswsntls
user=$(grep -E "^#vms " "/usr/local/etc/xray/vmess.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
harini=$(grep -E "^#vms " "/usr/local/etc/xray/vmess.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#vms " "/usr/local/etc/xray/vmess.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^#vms " "/usr/local/etc/xray/vmess.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
cat>/usr/local/etc/xray/$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "ufuture.uitm.edu.my",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "CF-RAY:http://ufuture.uitm.edu.my$patchtls",
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
      "path": "CF-RAY:http://onlinepayment.celcom.com.my$patchtls",
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
      "path": "CF-RAY:http://www.who.int$patchnontls",
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
clear
echo -e ""
echo -e "\e[$line══════════════════════════════════════════════════════════════════${NC}"
echo -e "\e[$back_text                         \e[30m[\e[$box XRAY VMESS WS\e[30m]                         \e[m"
echo -e "\e[$line══════════════════════════════════════════════════════════════════${NC}"
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "IP/Host        : $MYIP"
echo -e "Port TLS       : ${tls}"
echo -e "Port None TLS  : ${none}"
echo -e "User ID        : ${uuid}"
echo -e "Security       : Auto"
echo -e "Network        : Websocket"
echo -e "Path Tls       : $patchtls"
echo -e "Path None Tls  : $patchnontls"
echo -e "allowInsecure  : True/allow"
echo -e "Support Yaml   : YES"
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
echo ""
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
xraay
}
# ADD USER VLESS WS
function menu4 () {
clear
tls="$(cat ~/log-install.txt | grep -w "Vless Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless Ws None Tls" | cut -d: -f2|sed 's/ //g')"
echo -e " ${Lred}══════════════════════════════════════════════════════════════════${NC}"
echo -e " ${BGWHITE}                     [ XRAY VLESS WS ]                            ${NC}"
echo -e " ${Lred}══════════════════════════════════════════════════════════════════${NC}"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "   Username: " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/vless.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
patchtls=/nevermore-vlesswstls
patchnontls=/nevermore-vlesswsntls
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
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/vless.json
sed -i '/#xray-vless-nontls$/a\#vls '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/vlessnone.json
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
systemctl restart xray@vless
systemctl restart xray@vlessnone
clear
echo -e ""
echo -e " ${Lred}══════════════════════════════════════════════════════════════════${NC}"
echo -e " ${BGWHITE}                     [ XRAY VLESS WS ]                            ${NC}"
echo -e " ${Lred}══════════════════════════════════════════════════════════════════${NC}"
echo -e "Remarks          : ${user}"
echo -e "Domain           : ${domain}"
echo -e "IP/Host          : $MYIP"
echo -e "Port TLS         : $tls"
echo -e "Port None TLS    : $none"
echo -e "User ID          : ${uuid}"
echo -e "Encryption       : None"
echo -e "Network          : WebSocket"
echo -e "Path Tls         : $patchtls"
echo -e "Path None Tls    : $patchnontls"
echo -e "allowInsecure    : True/allow"
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
echo ""
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
xraay
}
# TRIAL USER VLESS WS
function menu5 () {
clear
tls="$(cat ~/log-install.txt | grep -w "Vless Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless Ws None Tls" | cut -d: -f2|sed 's/ //g')"
echo -e " ${Lred}══════════════════════════════════════════════════════════════════${NC}"
echo -e " ${BGWHITE}                     [ TRIAL XRAY VLESS WS ]                      ${NC}"
echo -e " ${Lred}══════════════════════════════════════════════════════════════════${NC}"
# Create Expried 
masaaktif="1"
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")

# Make Random Username 
user=Trial`</dev/urandom tr -dc X-Z0-9 | head -c4`

patchtls=/nevermore-vlesswstls
patchnontls=/nevermore-vlesswsntls
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
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/vless.json
sed -i '/#xray-vless-nontls$/a\#vls '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/vlessnone.json
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
systemctl restart xray@vless
systemctl restart xray@vlessnone
clear
echo -e ""
echo -e " ${Lred}══════════════════════════════════════════════════════════════════${NC}"
echo -e " ${BGWHITE}                     [ TRIAL XRAY VLESS WS ]                      ${NC}"
echo -e " ${Lred}══════════════════════════════════════════════════════════════════${NC}"
echo -e "Remarks          : ${user}"
echo -e "Domain           : ${domain}"
echo -e "IP/Host          : $MYIP"
echo -e "Port TLS         : $tls"
echo -e "Port None TLS    : $none"
echo -e "User ID          : ${uuid}"
echo -e "Encryption       : None"
echo -e "Network          : WebSocket"
echo -e "Path Tls         : $patchtls"
echo -e "Path None Tls    : $patchnontls"
echo -e "allowInsecure    : True/allow"
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
echo ""
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
xraay
}
# show user vless ws
function menu6 () {
clear
tls="$(cat ~/log-install.txt | grep -w "Vless Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless Ws None Tls" | cut -d: -f2|sed 's/ //g')"
NUMBER_OF_CLIENTS=$(grep -c -E "^#vls " "/usr/local/etc/xray/vless.json")
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
	grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
patchtls=/nevermore-vlesswstls
patchnontls=/nevermore-vlesswsntls
user=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
harini=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
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
echo -e " ${Lred}══════════════════════════════════════════════════════════════════${NC}"
echo -e " ${BGWHITE}                     [ XRAY VLESS WS ]                            ${NC}"
echo -e " ${Lred}══════════════════════════════════════════════════════════════════${NC}"
echo -e "Remarks          : ${user}"
echo -e "Domain           : ${domain}"
echo -e "IP/Host          : $MYIP"
echo -e "Port TLS         : $tls"
echo -e "Port None TLS    : $none"
echo -e "User ID          : ${uuid}"
echo -e "Encryption       : None"
echo -e "Network          : WebSocket"
echo -e "Path Tls         : $patchtls"
echo -e "Path None Tls    : $patchnontls"
echo -e "allowInsecure    : True/allow"
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
echo ""
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
xraay
}
# FUCTION CREATE USER TROJAN
function menu7 () {
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
function menu8 () {
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
function menu9 () {
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
echo -e "   \e[$line ══════════════════════════════════════════\e[m"
echo -e "    \e[$back_text     \e[30m[\e[$box VMESS MAXIS & DIGI CELCOM YES\e ]\e[30m     \e[m"
echo -e "   \e[$line ══════════════════════════════════════════\e[m"
echo -e "    \e[$number (•1)\e[m \e[$below XRAY VMESS MAXIS DIGI CELCOM YES\e[m"
echo -e "    \e[$number (•2)\e[m \e[$below XRAY VMESS TRIAL MAXIS DIGI CELCOM YES\e[m"
echo -e "    \e[$number (•3)\e[m \e[$below XRAY SHOW CONFIQ VMESS MAXIS DIGI CELCOM YES\e[m"
echo -e ""
echo -e "   \e[$number    >> Total :\e[m \e[$below ${total1} Client\e[m"
echo -e "   \e[$line ══════════════════════════════════════════\e[m"
echo -e "    \e[$back_text       \e[30m[\e[$box VLESS MAXIS & DIGI CELCOM\e ]\e[30m       \e[m"
echo -e "   \e[$line ══════════════════════════════════════════\e[m"
echo -e "    \e[$number (•4)\e[m \e[$below XRAY VLESS MAXIS DIGI CELCOM YES UMOBILE\e[m"
echo -e "    \e[$number (•5)\e[m \e[$below XRAY VLESS TRIAL MAXIS DIGI CELCOM YES UMOBILE\e[m"
echo -e "    \e[$number (•6)\e[m \e[$below XRAY SHOW CONFIQ VLESS MAXIS DIGI CELCOM YES\e[m"
echo -e ""
echo -e "   \e[$number    >> Total :\e[m \e[$below ${total2} Client\e[m"
echo -e "   \e[$line ══════════════════════════════════════════\e[m"
echo -e "    \e[$back_text       \e[30m[\e[$box TROJAN MAXIS & DIGI CELCOM\e ]\e[30m      \e[m"
echo -e "   \e[$line ══════════════════════════════════════════\e[m"
echo -e "    \e[$number (•7)\e[m \e[$below XRAY TROJAN MAXIS DIGI CELCOM YES UMOBILE\e[m"
echo -e "    \e[$number (•8)\e[m \e[$below XRAY TROJAN TRIAL MAXIS DIGI CELCOM YES UMOBILE\e[m"
echo -e "    \e[$number (•9)\e[m \e[$below XRAY TROJAN CONFIQ VLESS MAXIS DIGI CELCOM YES UMOBILE\e[m"
echo -e ""
echo -e "   \e[$number    >> Total :\e[m \e[$below ${total3} Client\e[m"
echo -e "   \e[$line ══════════════════════════════════════════\e[m"
echo -e "    \e[$back_text  \e[$box x)   MENU                              \e[m"
echo -e "   \e[$line ══════════════════════════════════════════\e[m"
echo -e "\e[$line"
read -rp "      Please Input Number  [1-9 or x] :  "  num
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
elif [[ "$num" = "x" ]]; then
menu
else
clear
echo -e "\e[1;31mYou Entered The Wrong Number, Please Try Again!\e[0m"
sleep 1
menu
fi
