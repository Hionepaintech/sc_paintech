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

function add_ip(){
    clear
    echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
    echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• REGISTER IPVPS •              ${NC} $COLOR1 $NC"
    echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
    echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
    rm -rf /root/rmbl
    read -p "   NEW IPVPS : " daftar
    echo -e "$COLOR1 ${NC}"
    echo -e "$COLOR1 ${NC}  [INFO] Checking the IPVPS!"
    sleep 1
    REQIP=$(curl -sS https://raw.githubusercontent.com/${USERGIT}/${REPOGIT}/main/ipmini | awk '{print $4}' | grep $daftar)
    if [[ $daftar = $REQIP ]]; then
        echo -e "$COLOR1 ${NC}  [INFO] VPS IP Already Registered!!"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
        echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
        echo -e "$COLOR1 ${NC}                ${WH}• PAINTECHVPN  •${NC}                 $COLOR1 $NC"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
        echo -e ""
        read -n 1 -s -r -p "   Press any key to back on menu"
        m-ip
    else
        echo -e "$COLOR1 ${NC}  [INFO] OK! IP VPS is not Registered!"
        echo -e "$COLOR1 ${NC}  [INFO] Lets Regester it!"
        sleep 3
        clear
    fi
    echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
    echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• REGISTER IPVPS •              ${NC} $COLOR1 $NC"
    echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
    echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
    read -p "   User Name  : " client
    if [ -z $client ]; then
        cd
        echo -e "$COLOR1 ${NC}  [INFO] Please Input client"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
        echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
        echo -e "$COLOR1 ${NC}                ${WH}• PAINTECHVPN  •${NC}                 $COLOR1 $NC"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
        echo -e ""
        read -n 1 -s -r -p "   Press any key to back on menu"
        m-ip
    fi

    read -p "   EXP Date   : " exp
    if [ -z $exp ]; then
        cd
        echo -e "$COLOR1 ${NC}   [INFO] Please Input exp date"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
        echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
        echo -e "$COLOR1 ${NC}                ${WH}• PAINTECHVPN  •${NC}                 $COLOR1 $NC"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
        echo -e ""
        read -n 1 -s -r -p "   Press any key to back on menu"
        m-ip
    fi

    x="ok"

    satu="ON"
    dua="OFF"
    while true $x != "ok"
    do
        echo -e "$COLOR1 ${NC}"
        echo -e "$COLOR1 ${NC}  ${COLOR1}[01]${NC} • ADMIN   ${COLOR1}[02]${NC} • NORMAL"
        echo -e "$COLOR1 ${NC}"
        echo -ne "   Input your choice : "; read list
        echo ""
        case "$list" in 
            1) isadmin="$satu";break;;
            2) isadmin="$dua";break;;
        esac
    done

    exp=$(date -d "$exp days" +"%Y-%m-%d")
    hariini=$(date -d "0 days" +"%Y-%m-%d")
    git config --global user.email "${EMAILGIT}" &> /dev/null
    git config --global user.name "${USERGIT}" &> /dev/null
    git clone https://github.com/${USERGIT}/${REPOGIT}.git &> /dev/null
    cd /root/${REPOGIT}/ &> /dev/null
    rm -rf .git &> /dev/null
    git init &> /dev/null
    touch ipmini &> /dev/null
    touch newuser &> /dev/null
    TEXT="
    Name        : $client 
    Admin Panel : $isadmin
    Exp         : $exp 
    IPVPS       : $daftar 
    Reg Date    : $hariini
    " 
    echo "${TEXT}" >>/root/${REPOGIT}/newuser 
    echo "### $client $exp $daftar $isadmin" >>/root/${REPOGIT}/ipmini 
    git add .
    git commit -m "register" &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/${USERGIT}/${REPOGIT}.git &> /dev/null
    git push -f https://${APIGIT}@github.com/${USERGIT}/${REPOGIT}.git &> /dev/null
    sleep 1
    clear

    
    echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
    echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• REGISTER IPVPS •              ${NC} $COLOR1 $NC"
    echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
    echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
    echo -e "$COLOR1 ${NC}  Client IP Registed Successfully"
    echo -e "$COLOR1 ${NC}"
    echo -e "$COLOR1 ${NC}  Client Name   : $client"
    echo -e "$COLOR1 ${NC}  Admin Panel   : $isadmin"
    echo -e "$COLOR1 ${NC}  IP VPS        : $daftar"
    echo -e "$COLOR1 ${NC}  Register Date : $hariini"
    echo -e "$COLOR1 ${NC}  Expired Date  : $exp"
    cd
    rm -rf /root/${REPOGIT}
    echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
    echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
    echo -e "$COLOR1 ${NC}                ${WH}• PAINTECHVPN •${NC}                 $COLOR1 $NC"
    echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
    echo ""
    read -n 1 -s -r -p "   Press any key to back on menu"
    m-ip
}
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• PAINTECHVPN •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
echo -e "   $COLOR1 [01]$NC • ADD IPVPS
echo -e "   $COLOR1 [00]$NC • GO BACK
echo ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; add_ip ;;
00 | 0) clear ; menu ;;
*) clear ; m-ip ;;
esac