#!/bin/bash

MYIP=$(wget -qO- ipinfo.io/ip)
colornow=$(cat /etc/rmbl/theme/color.conf)
NC="\e[0m"
COLOR1="$(cat /etc/rmbl/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/rmbl/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'

function add_ip(){
    clear
    echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
    echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• REGISTER IPVPS •              ${NC} $COLOR1 $NC"
    echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
    echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
    rm -rf /root/permission
    read -p "   NEW IPVPS : " daftar
    echo -e "$COLOR1 ${NC}"
    echo -e "$COLOR1 ${NC}  [INFO] Checking the IPVPS!"
    sleep 1
    REQIP=$(curl -sS https://raw.githubusercontent.com/Hionepaintech/Licensing-/main/ipmini | awk '{print $4}' | grep $daftar)
    if [[ $daftar == $REQIP ]]; then
        echo -e "$COLOR1 ${NC}  [INFO] VPS IP Already Registered!!"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
        echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
        echo -e "$COLOR1 ${NC}                ${WH}• 𝔻ℝ𝕐𝔸ℕℤ 𝕊ℂℝ𝕀ℙ𝕋 •${NC}                 $COLOR1 $NC"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
        echo -e ""
        read -n 1 -s -r -p "   Press any key to back on menu"
        menu-ip
    else
        echo -e "$COLOR1 ${NC}  [INFO] OK! IP VPS is not Registered!"
        echo -e "$COLOR1 ${NC}  [INFO] Let's Register it!"
        sleep 3
        clear
    fi
    echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
    echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• REGISTER IPVPS •              ${NC} $COLOR1 $NC"
    echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
    echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
    read -p "   User Name  : " client
    if [ -z "$client" ]; then
        cd
        echo -e "$COLOR1 ${NC}  [INFO] Please Input client"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
        echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
        echo -e "$COLOR1 ${NC}                ${WH}• 𝔻ℝ𝕐𝔸ℕℤ 𝕊ℂℝ𝕀ℙ𝕋 •${NC}                 $COLOR1 $NC"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
        echo -e ""
        read -n 1 -s -r -p "   Press any key to back on menu"
        menu-ip
    fi

    read -p "   EXP Date   : " exp
    if [ -z "$exp" ]; then
        cd
        echo -e "$COLOR1 ${NC}   [INFO] Please Input exp date"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
        echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
        echo -e "$COLOR1 ${NC}                ${WH}• 𝔻ℝ𝕐𝔸ℕℤ 𝕊ℂℝ𝕀ℙ𝕋 •${NC}                 $COLOR1 $NC"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
        echo -e ""
        read -n 1 -s -r -p "   Press any key to back on menu"
        menu-ip
    fi

    satu="ON"
    dua="OFF"
    while true; do
        echo -e "$COLOR1 ${NC}"
        echo -e "$COLOR1 ${NC}  ${COLOR1}[01]${NC} • ADMIN   ${COLOR1}[02]${NC} • NORMAL"
        echo -e "$COLOR1 ${NC}"
        echo -ne "   Input your choice : "; read list
        echo ""
        case "$list" in 
            1) isadmin="$satu"; break;;
            2) isadmin="$dua"; break;;
        esac
    done

    exp=$(date -d "$exp days" +"%Y-%m-%d")
    hariini=$(date -d "0 days" +"%Y-%m-%d")
    git config --global user.email "mr.ryuuko@gmail.com" &> /dev/null
    git config --global user.name "Hionepaintech" &> /dev/null
    git clone https://github.com/Hionepaintech/Licensing-.git /root/permission &> /dev/null
    cd /root/permission &> /dev/null
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
    echo "${TEXT}" >> /root/permission/newuser 
    echo "### $client $exp $daftar $isadmin" >> /root/permission/ipmini 
    git add .
    git commit -m register &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/Hionepaintech/Licensing-.git &> /dev/null
    git push -f https://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@github.com/Hionepaintech/Licensing-.git &> /dev/null
    sleep 1
    clear
    echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
    echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• REGISTER IPVPS •              ${NC} $COLOR1 $NC"
    echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
    echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
    echo -e "$COLOR1 ${NC}  Client IP Registered Successfully"
    echo -e "$COLOR1 ${NC}"
    echo -e "$COLOR1 ${NC}  Client Name   : $client"
    echo -e "$COLOR1 ${NC}  Admin Panel   : $isadmin"
    echo -e "$COLOR1 ${NC}  IP VPS        : $daftar"
    echo -e "$COLOR1 ${NC}  Register Date : $hariini"
    echo -e "$COLOR1 ${NC}  Expired Date  : $exp"
    cd
    rm -rf /root/permission
    echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
    echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
    echo -e "$COLOR1 ${NC}                ${WH}• 𝔻ℝ𝕐𝔸ℕℤ 𝕊ℂℝ𝕀ℙ𝕋 •${NC}                 $COLOR1 $NC"
    echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
    echo ""
    read -n 1 -s -r -p "   Press any key to back on menu"
    menu-ip
}
