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
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m    • CHANGE PORT SERVICE •        \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] Change Port Stunnel4"
echo -e " [\e[36m•2\e[0m] Change Port OpenVPN"
echo -e " [\e[36m•3\e[0m] Change Port Wireguard"
echo -e " [\e[36m•4\e[0m] Change Port Trojan"
echo -e " [\e[36m•5\e[0m] Change Port Squid"
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo -e   ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; port-ssl ; exit ;;
2) clear ; port-ovpn ; exit ;;
3) clear ; port-wg ; exit ;;
4) clear ; port-tr ; exit ;;
5) clear ; port-squid ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo -e "" ; echo "Boh salah tekan, Sayang kedak Babi" ; sleep 1 ; port-change ;;
esac