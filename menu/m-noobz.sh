# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Exporting URL Host
export Server_URL="autosc.me/aio"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther="XdrgVPN"

colornow=$(cat /etc/rmbl/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/rmbl/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/rmbl/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'

clear
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
author=$(cat /etc/profil)
TIMES="10"
CHATIDNEW=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEYNEW=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
URL="https://api.telegram.org/bot$KEYNEW/sendMessage"
domain=`cat /etc/xray/domain`
CHATIDC=$(cat /etc/per/id)
KEYC=$(cat /etc/per/token)
URL2="https://api.telegram.org/bot$KEYC/sendMessage"
if [ ! -e /etc/xray/noobz/akun ]; then
mkdir -p /etc/xray/noobz/akun
fi
function create(){
clear

echo -e "$COLOR1╭═════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}              ${WH}• SSH PANEL MENU •               ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════╯${NC}"
read -p "Username: " user
read -p "Password: " pass
until [[ $exp =~ ^[0-9]+$ ]]; do
read -p "Exp (0 for unlimited days):" exp
done
read -p "IP LIMIT " ip

if [ ! -e /etc/sf/limit/noobs/ip/ ]; then
  mkdir -p /etc/sf/limit/noobs/ip/
fi
echo "$ip" > /etc/sf/limit/noobs/ip/$user

noobzvpns --add-user $user $pass --expired-user $user $exp
expi=`date -d "$exp days" +"%Y-%m-%d"`
useradd -e `date -d "$exp days" +"%Y-%m-%d"` -s /bin/false -M $user
exp="$(chage -l $user | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$pass\n$pass\n"|passwd $user &> /dev/null
echo -e "### $user $expi $pass" >> /etc/xray/noob
clear
cat > /home/vps/public_html/noobzvpns-$user.txt <<-END
◇━━━━━━━━━━━━━━━━━◇
NOOBZVPN ACCOUNT
◇━━━━━━━━━━━━━━━━━◇
DOMAIN : $domain
USERNAME : $user
PASSWORD : $pass
IP LIMIT : $ip
EXP DAYS : $expi ( $exp Days )
tcp_std port :  8080
tcp_ssl port : 8443
◇━━━━━━━━━━━━━━━━━◇
Example config TCP_STD 8080
◇━━━━━━━━━━━━━━━━━◇

EP4K5Xir0hFH0Dr6ODkZjI9/qLRv/EPaVq5R9HDKsVTOWnZQ8wvQyocsCDPFuedq3CK5HCiDtSNnOl28XyudCjvb2OLpa8gL0Z397hRkiTGbWhbZW53Lln01/HkvrEL5OZLTSMqU4kCy11/9Iyta0tmDIUYyjgNBtmnDmwWMX0eAXtq5uzusq3upiulAJpisFhQvu0o7r2KF1MiSmTUOw/R8mgTpsf+arKnKmWdRNIkTSmhMLE3aD/I2Ke2FJtgHyVADBbj0S0W76XuSl39v3atM1OeuZ7mwxQwKpRfVJhWApiMV9Ho0ydANOK5BQJbhC2s38rGhk1E0A0Jw/XxNqd1a490n/FdHtfSev6BPaP6y0+xFUrr4U+H+ug+e/Avgaszd79w5VeUPK+YhWJOYiX/VnC6L9lKJ3m6OmjKXAmIF47C7lVTsosFz4IAbdqNqg9q7B1XKOiLBGUkGaZi89jQ/I6zS5+KRBv48KiQnUz6BRVQEjGl0FjP7zNR0BtfrGh1XF8EWDZMyCdw70+ydeIv+Z9VZRgNIPpvbTUeeqYYdAExEm9rtofvbodoNLJ06+n5yy1uDBt5rzzEb

◇━━━━━━━━━━━━━━━━━◇
Example config TCP_SSL 8443
◇━━━━━━━━━━━━━━━━━◇

EDN2OyxHptYxagbPw+cr7WjqSeEiEM3qJJOPRUu9B9Or+RpXrxnkf3FbEEB+gJGI2xYO6vGykvWv8h7wpkGNvqQTD8ZksoB7l6xz79DJxQg1VWBraNsMJjIguQa0my7x0TRm+RkLbU7QpONyU+YxijbzuBCpBSpNIDa2JPNHN5kuxoBvpasbJA+u8G9PZxuAh/UZXVWEGGehbxQFefkAp7WcFB1mGIArVYcbRZ3p8+m8BpKcspbfNblp0GSxFfayu19NZvSXXwQO5sVCiJ5KQdw+niUC8vRJNqYf+leIplDeeQvhbc7BMgYSznoEegcA/A8jSiRyTyp15O1zoeRxpE3naXlrkI3Xw7/VClS9KGqnHdHS0sHQqxmud1AqjSUsAsHAC/NTS3HrxUKoftqYQu4/qTQbYE/O7LtLky7lvgJgYJZRZiHXh8ETfS/i/A3XLpsx7zayzlDiw8IildWmm0t6Y13PPlhU+4tbfSjXTeO5BcqunbsH0pQoTS7Ojp2F0DqJgM3uVU6TL9A5YnViml3w8MKN5wLT9usIxQYVqf1boIuVDVmyY2BSYO8ljhkeFsO682JYQx/T5IlOrxToMLAs

◇━━━━━━━━━━━━━━━━━◇
 • PAINTECH VPN • 
◇━━━━━━━━━━━━━━━━━◇
END
if [[ -e /etc/noobz ]]; then
TEXT="
◇━━━━━━━━━━━━━━━━━◇
NOOBZVPN ACCOUNT
◇━━━━━━━━━━━━━━━━━◇
DOMAIN : <code>$domain</code>
USERNAME : <code>$user</code>
PASSWORD : <code>$pass</code>
IP LIMIT : $ip
EXP DAYS : $expi ( $exp Days )
tcp_std port :  8080
tcp_ssl port : 8443
◇━━━━━━━━━━━━━━━━━◇
Example config TCP_STD 8080
◇━━━━━━━━━━━━━━━━━◇

<code>EP4K5Xir0hFH0Dr6ODkZjI9/qLRv/EPaVq5R9HDKsVTOWnZQ8wvQyocsCDPFuedq3CK5HCiDtSNnOl28XyudCjvb2OLpa8gL0Z397hRkiTGbWhbZW53Lln01/HkvrEL5OZLTSMqU4kCy11/9Iyta0tmDIUYyjgNBtmnDmwWMX0eAXtq5uzusq3upiulAJpisFhQvu0o7r2KF1MiSmTUOw/R8mgTpsf+arKnKmWdRNIkTSmhMLE3aD/I2Ke2FJtgHyVADBbj0S0W76XuSl39v3atM1OeuZ7mwxQwKpRfVJhWApiMV9Ho0ydANOK5BQJbhC2s38rGhk1E0A0Jw/XxNqd1a490n/FdHtfSev6BPaP6y0+xFUrr4U+H+ug+e/Avgaszd79w5VeUPK+YhWJOYiX/VnC6L9lKJ3m6OmjKXAmIF47C7lVTsosFz4IAbdqNqg9q7B1XKOiLBGUkGaZi89jQ/I6zS5+KRBv48KiQnUz6BRVQEjGl0FjP7zNR0BtfrGh1XF8EWDZMyCdw70+ydeIv+Z9VZRgNIPpvbTUeeqYYdAExEm9rtofvbodoNLJ06+n5yy1uDBt5rzzEb</code>

◇━━━━━━━━━━━━━━━━━◇
Example config TCP_SSL 8443
◇━━━━━━━━━━━━━━━━━◇

<code>EDN2OyxHptYxagbPw+cr7WjqSeEiEM3qJJOPRUu9B9Or+RpXrxnkf3FbEEB+gJGI2xYO6vGykvWv8h7wpkGNvqQTD8ZksoB7l6xz79DJxQg1VWBraNsMJjIguQa0my7x0TRm+RkLbU7QpONyU+YxijbzuBCpBSpNIDa2JPNHN5kuxoBvpasbJA+u8G9PZxuAh/UZXVWEGGehbxQFefkAp7WcFB1mGIArVYcbRZ3p8+m8BpKcspbfNblp0GSxFfayu19NZvSXXwQO5sVCiJ5KQdw+niUC8vRJNqYf+leIplDeeQvhbc7BMgYSznoEegcA/A8jSiRyTyp15O1zoeRxpE3naXlrkI3Xw7/VClS9KGqnHdHS0sHQqxmud1AqjSUsAsHAC/NTS3HrxUKoftqYQu4/qTQbYE/O7LtLky7lvgJgYJZRZiHXh8ETfS/i/A3XLpsx7zayzlDiw8IildWmm0t6Y13PPlhU+4tbfSjXTeO5BcqunbsH0pQoTS7Ojp2F0DqJgM3uVU6TL9A5YnViml3w8MKN5wLT9usIxQYVqf1boIuVDVmyY2BSYO8ljhkeFsO682JYQx/T5IlOrxToMLAs</code>

◇━━━━━━━━━━━━━━━━━◇
 • PAINTECH VPN • 
◇━━━━━━━━━━━━━━━━━◇
"
else
TEXT="
◇━━━━━━━━━━━━━━━━━◇
NOOBZVPN ACCOUNT
◇━━━━━━━━━━━━━━━━━◇
DOMAIN : <code>$domain</code>
USERNAME : <code>$user</code>
PASSWORD : <code>$pass</code>
IP LIMIT : $ip
EXP DAYS : $expi ( $exp Days )
tcp_std port :  8080
tcp_ssl port : 8443
◇━━━━━━━━━━━━━━━━━◇
Example config TCP_STD 8080
◇━━━━━━━━━━━━━━━━━◇

<code>EP4K5Xir0hFH0Dr6ODkZjI9/qLRv/EPaVq5R9HDKsVTOWnZQ8wvQyocsCDPFuedq3CK5HCiDtSNnOl28XyudCjvb2OLpa8gL0Z397hRkiTGbWhbZW53Lln01/HkvrEL5OZLTSMqU4kCy11/9Iyta0tmDIUYyjgNBtmnDmwWMX0eAXtq5uzusq3upiulAJpisFhQvu0o7r2KF1MiSmTUOw/R8mgTpsf+arKnKmWdRNIkTSmhMLE3aD/I2Ke2FJtgHyVADBbj0S0W76XuSl39v3atM1OeuZ7mwxQwKpRfVJhWApiMV9Ho0ydANOK5BQJbhC2s38rGhk1E0A0Jw/XxNqd1a490n/FdHtfSev6BPaP6y0+xFUrr4U+H+ug+e/Avgaszd79w5VeUPK+YhWJOYiX/VnC6L9lKJ3m6OmjKXAmIF47C7lVTsosFz4IAbdqNqg9q7B1XKOiLBGUkGaZi89jQ/I6zS5+KRBv48KiQnUz6BRVQEjGl0FjP7zNR0BtfrGh1XF8EWDZMyCdw70+ydeIv+Z9VZRgNIPpvbTUeeqYYdAExEm9rtofvbodoNLJ06+n5yy1uDBt5rzzEb</code>

◇━━━━━━━━━━━━━━━━━◇
Example config TCP_SSL 8443
◇━━━━━━━━━━━━━━━━━◇

<code>EDN2OyxHptYxagbPw+cr7WjqSeEiEM3qJJOPRUu9B9Or+RpXrxnkf3FbEEB+gJGI2xYO6vGykvWv8h7wpkGNvqQTD8ZksoB7l6xz79DJxQg1VWBraNsMJjIguQa0my7x0TRm+RkLbU7QpONyU+YxijbzuBCpBSpNIDa2JPNHN5kuxoBvpasbJA+u8G9PZxuAh/UZXVWEGGehbxQFefkAp7WcFB1mGIArVYcbRZ3p8+m8BpKcspbfNblp0GSxFfayu19NZvSXXwQO5sVCiJ5KQdw+niUC8vRJNqYf+leIplDeeQvhbc7BMgYSznoEegcA/A8jSiRyTyp15O1zoeRxpE3naXlrkI3Xw7/VClS9KGqnHdHS0sHQqxmud1AqjSUsAsHAC/NTS3HrxUKoftqYQu4/qTQbYE/O7LtLky7lvgJgYJZRZiHXh8ETfS/i/A3XLpsx7zayzlDiw8IildWmm0t6Y13PPlhU+4tbfSjXTeO5BcqunbsH0pQoTS7Ojp2F0DqJgM3uVU6TL9A5YnViml3w8MKN5wLT9usIxQYVqf1boIuVDVmyY2BSYO8ljhkeFsO682JYQx/T5IlOrxToMLAs</code>

◇━━━━━━━━━━━━━━━━━◇
 • PAINTECH VPN • 
◇━━━━━━━━━━━━━━━━━◇
"
fi
curl -s --max-time $TIMES -d "chat_id=$CHATIDC&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL2 >/dev/null
cd
if [ ! -e /etc/tele ]; then
echo -ne
else
echo "$TEXT" > /etc/notiftele
bash /etc/tele
fi
user2=$(echo "$user" | cut -c 1-3)
TIME2=$(date +'%Y-%m-%d %H:%M:%S')
TEXT2="
<code>◇━━━━━━━━━━━━━━◇</code>
<code>   TRANSAKSI SSH SUCCES </code>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>DOMAIN   :</code> <code>${domain} </code>
<code>ISP      :</code> <code>$ISP $CITY </code>
<code>DATE   :</code> <code>${TIME2} WIB </code>
<code>DETAIL   :</code> <code>Trx NOOBZVPN </code>
<code>USER :</code> <code>${user2}xxx </code>
<code>DURASI  :</code> <code>$exp Hari </code>
<code>◇━━━━━━━━━━━━━━◇</code>
<i>AutoNotif Create Akun From Server..</i>"
curl -s --max-time $TIMES -d "chat_id=$CHATIDNEW&disable_web_page_preview=1&text=$TEXT2&parse_mode=html" $URL >/dev/null
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "NOOBZVPN ACCOUNT" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "DOMAIN : $( cat /etc/xray/domain )" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "USERNAME: $user" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "PASSWORD: $pass" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "IP LIMIT: $ip" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "EXP DAYS: EXP DAYS : $expi ( $exp Days )" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "tcp_std port:  8080" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "tcp_ssl port: 8443" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "Example config TCP_STD 8080" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo "" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "EP4K5Xir0hFH0Dr6ODkZjI9/qLRv/EPaVq5R9HDKsVTOWnZQ8wvQyocsCDPFuedq3CK5HCiDtSNnOl28XyudCjvb2OLpa8gL0Z397hRkiTGbWhbZW53Lln01/HkvrEL5OZLTSMqU4kCy11/9Iyta0tmDIUYyjgNBtmnDmwWMX0eAXtq5uzusq3upiulAJpisFhQvu0o7r2KF1MiSmTUOw/R8mgTpsf+arKnKmWdRNIkTSmhMLE3aD/I2Ke2FJtgHyVADBbj0S0W76XuSl39v3atM1OeuZ7mwxQwKpRfVJhWApiMV9Ho0ydANOK5BQJbhC2s38rGhk1E0A0Jw/XxNqd1a490n/FdHtfSev6BPaP6y0+xFUrr4U+H+ug+e/Avgaszd79w5VeUPK+YhWJOYiX/VnC6L9lKJ3m6OmjKXAmIF47C7lVTsosFz4IAbdqNqg9q7B1XKOiLBGUkGaZi89jQ/I6zS5+KRBv48KiQnUz6BRVQEjGl0FjP7zNR0BtfrGh1XF8EWDZMyCdw70+ydeIv+Z9VZRgNIPpvbTUeeqYYdAExEm9rtofvbodoNLJ06+n5yy1uDBt5rzzEb" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo "" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "Example config TCP_SSL 8443" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo "" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "EDN2OyxHptYxagbPw+cr7WjqSeEiEM3qJJOPRUu9B9Or+RpXrxnkf3FbEEB+gJGI2xYO6vGykvWv8h7wpkGNvqQTD8ZksoB7l6xz79DJxQg1VWBraNsMJjIguQa0my7x0TRm+RkLbU7QpONyU+YxijbzuBCpBSpNIDa2JPNHN5kuxoBvpasbJA+u8G9PZxuAh/UZXVWEGGehbxQFefkAp7WcFB1mGIArVYcbRZ3p8+m8BpKcspbfNblp0GSxFfayu19NZvSXXwQO5sVCiJ5KQdw+niUC8vRJNqYf+leIplDeeQvhbc7BMgYSznoEegcA/A8jSiRyTyp15O1zoeRxpE3naXlrkI3Xw7/VClS9KGqnHdHS0sHQqxmud1AqjSUsAsHAC/NTS3HrxUKoftqYQu4/qTQbYE/O7LtLky7lvgJgYJZRZiHXh8ETfS/i/A3XLpsx7zayzlDiw8IildWmm0t6Y13PPlhU+4tbfSjXTeO5BcqunbsH0pQoTS7Ojp2F0DqJgM3uVU6TL9A5YnViml3w8MKN5wLT9usIxQYVqf1boIuVDVmyY2BSYO8ljhkeFsO682JYQx/T5IlOrxToMLAs" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo "" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e " • PAINTECH VPN •" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
echo -e "◇━━━━━━━━━━━━━━━━━◇" | tee -a /etc/xray/noobz/akun/log-create-${user}.log
read -n 1 -s -r -p "Press any key to back on menu"
menu
}


function delete(){
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}              ${WH}• DELETE NOOBZ •                   ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
grep -E "^### " "/etc/xray/noob" | cut -d ' ' -f 2-3 | nl -s ') '
read -p "username :" user
noobzvpns --remove-user $user
expi=`date -d "$exp days" +"%Y-%m-%d"`
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}              ${WH}• DELETE NOOBZ •                   ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo -e ""
echo -e "$WH USERNAME $user HAS BEEN DELETE $NC"
echo -e "$WH EXPIRED : $expi $NC"
echo -e ""
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<code>  DELETE NOOBZVPNS</code>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>DOMAIN   :</code> <code>${domain} </code>
<code>ISP      :</code> <code>$ISP $CITY </code>
<code>USERNAME :</code> <code>$user</code>
<code>EXPIRED  :</code> <code>$expi </code>
<code>◇━━━━━━━━━━━━━━◇</code>
<i>Succes Delete This User...</i>
"
curl -s --max-time $TIMES -d "chat_id=$CHATIDNEW&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
cd
if [ ! -e /etc/tele ]; then
echo -ne
else
echo "$TEXT" > /etc/notiftele
bash /etc/tele
fi
echo -e "$COLOR1╭══════════════════════ • ${WH}BY${NC}${COLOR1} • ═══════════════════════╮${NC}"
echo -e "$COLOR1${NC}          ${WH}   • PainTech Vpn Tuneling  •                 $COLOR1 $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════════╯${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu
}


function renew(){
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}              ${WH}• RENEW NOOBZ •                    ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
read -p "username: " user
read -p "expired?: " exp
noobzvpns --renew-user $user --expired-user $user $exp
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}              ${WH}• RENEW NOOBZ •                    ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo "USERNAME: $user"
echo "renew success!!"
echo -e "$COLOR1╭══════════════════════ • ${WH}BY${NC}${COLOR1} • ═══════════════════════╮${NC}"
echo -e "$COLOR1${NC}          ${WH}   • PainTech Vpn Tuneling  •                 $COLOR1 $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════════╯${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu
}




function lock(){
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}              ${WH}• LOCK  NOOBZ •                    ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
read -p "username: " user
noobzvpns --block-user $user
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}              ${WH}• LOCK  NOOBZ •                    ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo "USERNAME: $user"
echo "locked success!!"
echo -e "$COLOR1╭══════════════════════ • ${WH}BY${NC}${COLOR1} • ═══════════════════════╮${NC}"
echo -e "$COLOR1${NC}          ${WH}   • PainTech Vpn Tuneling  •                 $COLOR1 $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════════╯${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu
}






function show(){

clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}             ${WH}• MEMBER  NOOBZ •                   ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
noobzvpns --info-all-user | awk '/^\s*\+.*-> active/ {gsub(/(issued\(yyyymmdd\)|hash_key): [0-9a-f]+/, ""); print; getline; print; getline; getline; getline; print; print "═══════════════════"}'

echo -e "$COLOR1╭══════════════════════ • ${WH}BY${NC}${COLOR1} • ═══════════════════════╮${NC}"
echo -e "$COLOR1${NC}          ${WH}   • PainTech Vpn Tuneling  •                 $COLOR1 $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════════╯${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu

}



function unlock(){
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}             ${WH}• UNLOCK  NOOBZ •                   ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
read -p "username: " user
noobzvpns --unblock-user $user
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}             ${WH}• UNLOCK  NOOBZ •                   ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo "USERNAME: $user"
echo "unlocked success!!"
echo -e "$COLOR1╭══════════════════════ • ${WH}BY${NC}${COLOR1} • ═══════════════════════╮${NC}"
echo -e "$COLOR1${NC}          ${WH}   • PainTech Vpn Tuneling  •                 $COLOR1 $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════════╯${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu
}



function remove(){
clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}             ${WH}• REMOVE  NOOBZ •                   ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"

read -p "Apakah Anda ingin menghapus semua user? (Y/N): " choice

if [ "$choice" == "Y" ] || [ "$choice" == "y" ]; then
    # Eksekusi perintah di sini
    echo "MENGHAPUS SEMUA USER!"
noobzvpns --remove-all-user
elif [ "$choice" == "N" ] || [ "$choice" == "n" ]; then
    echo "Membatalkan penghapusan."
menu-noobzvpns
else
    echo "Pilihan tidak valid."
fi

clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}             ${WH}• REMOVE  NOOBZ •                   ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo "USERNAME: $user"
echo "unlocked success!!"
echo -e "$COLOR1╭══════════════════════ • ${WH}BY${NC}${COLOR1} • ═══════════════════════╮${NC}"
echo -e "$COLOR1${NC}          ${WH}   • PainTech Vpn Tuneling  •                 $COLOR1 $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════════╯${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu
}




clear
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ ${NC}${COLBG1}                 ${WH}• NOOBZ PANEL MENU •            ${NC}$COLOR1 │ $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo -e "$COLOR1╭═══════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│ $NC  ${WH}[${COLOR1}01${WH}]${NC} ${COLOR1}• ${WH}ADD AKUN${NC}      ${WH}[${COLOR1}04${WH}]${NC} ${COLOR1}• ${WH}DELETE USER${NC}   $COLOR1 $NC"
echo -e "$COLOR1│ $NC  ${WH}[${COLOR1}02${WH}]${NC} ${COLOR1}• ${WH}SHOW AKUN${NC}     ${WH}[${COLOR1}05${WH}]${NC} ${COLOR1}• ${WH}LOCKED USER${NC}    $COLOR1 $NC"
echo -e "$COLOR1│ $NC  ${WH}[${COLOR1}03${WH}]${NC} ${COLOR1}• ${WH}RENEW AKUN${NC}    ${WH}[${COLOR1}06${WH}]${NC} ${COLOR1}• ${WH}UNLOCKED USER${NC}    $COLOR1 $NC"
echo -e "$COLOR1│ $NC  ${WH}[${COLOR1}00${WH}]${NC} ${COLOR1}• ${WH}GO BACK${NC}       ${WH}[${COLOR1}07${WH}]${NC} ${COLOR1}• ${WH}REMOVE ALL USER${NC}    $COLOR1 $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo -e "$COLOR1╭═════════════════════ • ${WH}BY${NC}${COLOR1} • ══════════════════════╮${NC}"
echo -e "$COLOR1${NC}          ${WH}   • PainTech Vpn Tuneling  •                 $COLOR1 $NC"
echo -e "$COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; create ;;
02 | 2) clear ; show ;;
03 | 3) clear ; renew ;;
04 | 4) clear ; delete ;;
05 | 5) clear ; lock ;;
06 | 6) clear ; unlock ;;
07 | 7) clear ; remove ;;
100) clear ; $up2u ;;
00 | 0) clear ; menu ;;
*) clear ; menu ;;
esac
