#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " [INFO] Downloading File"
sleep 2
wget -q -O /usr/bin/menu "https://satantech.serv00.net/arthepat/menu/menu.sh" && chmod +x /usr/bin/menu
wget -q -O /usr/bin/restore "https://satantech.serv00.net/arthepat/menu/restore.sh" && chmod +x /usr/bin/restore
wget -q -O /usr/bin/backup "https://satantech.serv00.net/arthepat/menu/backup.sh" && chmod +x /usr/bin/backup
wget -q -O /usr/bin/addnoobz "https://satantech.serv00.net/arthepat/bot/addnoobz.sh" && chmod +x /usr/bin/addnoobz
wget -q -O /usr/bin/cek-noobz "https://satantech.serv00.net/arthepat/bot/cek-noobz.sh" && chmod +x /usr/bin/cek-noobz
wget -q -O /usr/bin/m-noobz "https://satantech.serv00.net/arthepat/menu/m-noobz.sh" && chmod +x /usr/bin/m-noobz
wget -q -O /usr/bin/m-ip "https://satantech.serv00.net/arthepat/menu/m-ip.sh" && chmod +x /usr/bin/m-ip
wget -q -O /usr/bin/m-bot "https://satantech.serv00.net/arthepat/menu/m-bot.sh" && chmod +x /usr/bin/m-bot
wget -q -O /usr/bin/update "https://satantech.serv00.net/arthepat/menu/update.sh" && chmod +x /usr/bin/update
wget -q -O /usr/bin/m-theme "https://satantech.serv00.net/arthepat/menu/m-theme.sh" && chmod +x /usr/bin/m-theme
wget -q -O /usr/bin/m-vmess "https://satantech.serv00.net/arthepat/menu/m-vmess.sh" && chmod +x /usr/bin/m-vmess
wget -q -O /usr/bin/m-vless "https://satantech.serv00.net/arthepat/menu/m-vless.sh" && chmod +x /usr/bin/m-vless
wget -q -O /usr/bin/m-trojan "https://satantech.serv00.net/arthepat/menu/m-trojan.sh" && chmod +x /usr/bin/m-trojan
wget -q -O /usr/bin/m-system "https://satantech.serv00.net/arthepat/menu/m-system.sh" && chmod +x /usr/bin/m-system
wget -q -O /usr/bin/m-sshovpn "https://satantech.serv00.net/arthepat/menu/m-sshovpn.sh" && chmod +x /usr/bin/m-sshovpn
wget -q -O /usr/bin/m-ssws "https://satantech.serv00.net/arthepat/menu/m-ssws.sh" && chmod +x /usr/bin/m-ssws
wget -q -O /usr/bin/running "https://satantech.serv00.net/arthepat/menu/running.sh" && chmod +x /usr/bin/running
wget -q -O /usr/bin/m-backup "https://satantech.serv00.net/arthepat/menu/m-backup.sh" && chmod +x /usr/bin/m-backup
wget -q -O /usr/bin/m-update "https://satantech.serv00.net/arthepat/menu/m-update.sh" && chmod +x /usr/bin/m-update
wget -q -O /usr/bin/speedtest "https://satantech.serv00.net/arthepat/speedtest_cli.py" && chmod +x /usr/bin/speedtest
wget -q -O /usr/bin/bckpbot "https://satantech.serv00.net/arthepat/menu/bckpbot.sh" && chmod +x /usr/bin/bckpbot
wget -q -O /usr/bin/tendang "https://satantech.serv00.net/arthepat/menu/tendang.sh" && chmod +x /usr/bin/tendang
wget -q -O /usr/bin/bottelegram "https://satantech.serv00.net/arthepat/menu/bottelegram.sh" && chmod +x /usr/bin/bottelegram
wget -q -O /usr/bin/m-allxray "https://satantech.serv00.net/arthepat/menu/m-allxray.sh" && chmod +x /usr/bin/m-allxray
wget -q -O /usr/bin/xraylimit "https://satantech.serv00.net/arthepat/menu/xraylimit.sh" && chmod +x /usr/bin/xraylimit
wget -q -O /usr/bin/trialvmess "https://satantech.serv00.net/arthepat/menu/trialvmess.sh" && chmod +x /usr/bin/trialvmess
wget -q -O /usr/bin/trialvless "https://satantech.serv00.net/arthepat/menu/trialtrojan.sh" && chmod +x /usr/bin/trialtrojan
wget -q -O /usr/bin/trialtrojan "https://satantech.serv00.net/arthepat/menu/trialvless.sh" && chmod +x /usr/bin/trialvless
wget -q -O /usr/bin/trialssh "https://satantech.serv00.net/arthepat/menu/trialssh.sh" && chmod +x /usr/bin/trialssh
wget -q -O /usr/bin/autocpu "https://satantech.serv00.net/arthepat/install/autocpu.sh" && chmod +x /usr/bin/autocpu
wget -q -O /usr/bin/bantwidth "https://satantech.serv00.net/arthepat/install/bantwidth" && chmod +x /usr/bin/bantwidth
echo -e " [INFO] Download File Successfully"
sleep 2
exit