#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
CEKEXPIRED () {
    today=$(date -d +1day +%Y-%m-%d)
    Exp1=$(curl -sS https://raw.githubusercontent.com/zyanv01/nicesc/main/permission | grep $MYIP | awk '{print $3}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mSTATUS SCRIPT AKTIF...\e[0m"
    else
    echo -e "\e[31mSCRIPT ANDA EXPIRED!\e[0m";
    echo -e "\e[31mRenew IP letak tempoh banyak kit okay? hehe syg ktk #\e[0m"
    exit 0
fi
}
IZIN=$(curl -sS https://raw.githubusercontent.com/zyanv01/nicesc/main/permission | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
CEKEXPIRED
else
echo -e "\e[31mPermission Denied!\e[0m";
echo -e "\e[31mDaftar IP dalam github lok sayang okay? mun dah daftar tapi masih juak permission denied refresh dolok website ya hehe. Love you #\e[0m"
exit 0
fi
clear
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \E[0;100;33m        • AutoScript by IANVPN •            \E[0m"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[92m             ___   _   _  ___   _____ _  _    "
echo -e "\e[92m            |_ _| /_\ | \| \ \ / / _ \ \| |   "
echo -e "\e[92m             | | / _ \|    |\ V /|  _/    |   "
echo -e "\e[92m            |___/_/ \_\_|\_| \_/ |_| |_|\_|   "
echo -e "\e[93m                                            "
echo -e "\e[0m                  Since 13 August 2019                           "
echo -e "\e[0m          Cantik x Script? Lelah kmk polah hehe            "
echo -e "\e[0m                  Mudahan Sayang Suka                                                 "
echo -e "\e[0m                   Editor : RidzVPN                                 "
echo -e "\e[0m                     User : IanVPN                                             "
echo ""
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu