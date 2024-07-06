#!/bin/bash
# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'
# // Exporting URL Host
export Server_URL="autosc.me/aio"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther="XdrgVPN"

if [ ! -e /etc/xray/noobz/akun ]; then
mkdir -p /etc/xray/noobz/akun
fi

clear
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "      °NOOBZVPN'S CREATE°            "
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
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
