#!/bin/bash
TOKEN="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"
git clone https://github.com/Hionepaintech/Licensing- /root/ipvps/ &> /dev/null
clear
echo ""
echo -e "         LIST IP VPS"
grep -E "^###" "/root/ipvps/ipmini" | cut -d ' ' -f 2-6 | column -t | sort | uniq
grep -E "^#&"  "/root/ipvps/ipmini" | cut -d ' ' -f 2-6 | column -t | sort | uniq

read -p "Input IP Address To Delete : " ipdel
name=$(grep $ipdel /root/ipvps/ipmini | awk '{print $2}')
exp=$(grep $ipdel /root/ipvps/ipmini | awk '{print $3}')
if [[ -z ${name} ]]; then
    echo "IP Address not found!"
    rm -rf /root/ipvps
    exit 1
fi
if [[ ${exp} == 'Lifetime' ]]; then
    sed -i "/^#&   ${name}   ${exp} ${ipdel}/d" /root/ipvps/ipmini
else
    sed -i "/^### ${name} ${exp} ${ipdel}/d" /root/ipvps/ipmini
fi
cd /root/ipvps
git config --global user.email "mr.ryuuko@gmail.com" &> /dev/null
git config --global user.name "Hionepaintech" &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
git add . &> /dev/null
git commit -m "delete IP" &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/Hionepaintech/Licensing-
git push -f https://${TOKEN}@github.com/Hionepaintech/Licensing-.git &> /dev/null
rm -rf /root/ipvps
clear
sleep 1
echo "  Delete IP Address..."
sleep 1
echo "  Processing..."
sleep 1
echo "  Done!"
sleep 1
