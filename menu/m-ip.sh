#!/bin/bash

MYIP=$(wget -qO- ipinfo.io/ip);
colornow=$(cat /etc/rmbl/theme/color.conf)
NC="\e[0m"
COLOR1="$(cat /etc/rmbl/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/rmbl/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'

APIGIT="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"
EMAILGIT="mr.ryuuko@gmail.com"
USERGIT="Hionepaintech"
REPOGIT="Licensing-"

    function m-ip2(){
clear
cd
if [[ -e /etc/github/api ]]; then
m-ip
else
mkdir /etc/github
echo "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" > /etc/github/api
echo "mr.ryuuko@gmail.com" > /etc/github/email
echo "Hionepaintech" > /etc/github/username
m-ip
fi
}
uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
cekup=`uptime -p | grep -ow "day"`
if [ "$Isadmin" = "ON" ]; then
uis="${COLOR1}Premium ADMIN VIP$NC"
else
uis="${COLOR1}Premium Version$NC"
fi
}

dos2unix /usr/bin/m-ip
chmod +x /usr/bin/m-ip

clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• PAINTECHVPN •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
echo -e "   $COLOR1 [01]$NC • ADD IPVPS"
echo -e "    $COLOR1 [00]$NC • GO BACK"
echo ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; m-ip2 ;;
00 | 0) clear ; menu ;;
*) clear ; m-ip ;;
esac
