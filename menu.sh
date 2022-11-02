#!/bin/bash
MYIP=$(curl -sS ipv4.icanhazip.com)
echo "Checking VPS"
#########################
IZIN=$(curl -sS https://raw.githubusercontent.com/zyanv01/nicesc/main/permission | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
else
echo -e "\e[31mPermission Denied!\e[0m";
echo -e "\e[31mDaftar IP dalam github lok sayang okay? mun dah daftar tapi masih juak permission denied refresh dolok website ya hehe. Love you #\e[0m"
exit 0
fi
#EXPIRED
expired=$(curl -sS https://raw.githubusercontent.com/zyanv01/nicesc/main/permission | grep $MYIP | awk '{print $3}')
echo $expired > /root/expired.txt
today=$(date -d +1day +%Y-%m-%d)
while read expired
do
	exp=$(echo $expired | curl -sS https://raw.githubusercontent.com/zyanv01/nicesc/main/permission | grep $MYIP | awk '{print $3}')
	if [[ $exp < $today ]]; then
		Exp2="\033[1;31mExpired\033[0m"
        else
        Exp2=$(curl -sS https://raw.githubusercontent.com/zyanv01/nicesc/main/permission | grep $MYIP | awk '{print $3}')
	fi
done < /root/expired.txt
rm /root/expired.txt
Name=$(curl -sS https://raw.githubusercontent.com/zyanv01/nicesc/main/permission | grep $MYIP | awk '{print $2}')
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
# VPS Information
#Domain
domain=$(cat /etc/rare/xray/domain)
#Status certificate
modifyTime=$(stat $HOME/.acme.sh/${domain}_ecc/${domain}.key | sed -n '7,6p' | awk '{print $2" "$3" "$4" "$5}')
modifyTime1=$(date +%s -d "${modifyTime}")
currentTime=$(date +%s)
stampDiff=$(expr ${currentTime} - ${modifyTime1})
days=$(expr ${stampDiff} / 86400)
remainingDays=$(expr 90 - ${days})
tlsStatus=${remainingDays}
if [[ ${remainingDays} -le 0 ]]; then
	tlsStatus="expired"
fi
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
Sver=$(cat /home/version)
tele=$(cat /home/contact)
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear 
echo -e "\e[33m                                                            \e[0m"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "         • Since 13 August 2019 , I LOVE YOU •       "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[92m     ___ ___ ___ _____    ___   _   _  _ "
echo -e "\e[92m    | _ \_ _|   \_  / |  |_ _| /_\ | \| |"
echo -e "\e[92m    |   /| || |) / /| |__ | | / _ \|    |"
echo -e "\e[92m    |_|_\___|___/___|____|___/_/ \_\_|\_|"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "                                                                                         "
echo -e "\e[33m CPU Model            \e[0m: $cname"
echo -e "\e[33m CPU Frequency        \e[0m: $freq MHz"
echo -e "\e[33m Number Of Cores      \e[0m:  $cores"
echo -e "\e[33m CPU Usage            \e[0m:  $cpu_usage"
echo -e "\e[33m Operating System     \e[0m:  "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`	
echo -e "\e[33m Kernel               \e[0m:  `uname -r`"
echo -e "\e[33m Total Amount Of RAM  \e[0m:  $tram MB"
echo -e "\e[33m Used RAM             \e[0m: $red $uram\e[0m MB"
echo -e "\e[33m Free RAM             \e[0m:  $fram MB"
echo -e "\e[33m System Uptime        \e[0m:  $uptime "
echo -e "\e[33m Isp Name             \e[0m:  $ISP"
echo -e "\e[33m Domain               \e[0m:  $domain"	
echo -e "\e[33m Ip Vps               \e[0m:  $IPVPS"	
echo -e "\e[33m City                 \e[0m:  $CITY"
echo -e "\e[33m Time                 \e[0m:  $WKT"
echo -e "\e[33m Day                  \e[0m:  $DAY"
echo -e "\e[33m Date                 \e[0m:  $DATE"
echo -e "\e[33m Telegram             \e[0m:  $tele"
echo -e "\e[33m Script Version       \e[0m:  $Sver"
echo -e "\e[33m Certificate status   \e[0m:  \e[33mExpired in ${tlsStatus} days\e[0m"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[33m Traffic\e[0m       \e[33mToday      Yesterday     Month   "
echo -e "\e[33m Download\e[0m      $dtoday    $dyest       $dmon   \e[0m"
echo -e "\e[33m Upload\e[0m        $utoday    $uyest       $umon   \e[0m"
echo -e "\e[33m Total\e[0m       \033[0;36m  $ttoday    $tyest       $tmon  \e[0m "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "                 • SCRIPT MENU, SAYANG BAU •                 "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " [\e[36m•1\e[0m] SSH & OpenVPN Menu  [\e[36m•7\e[0m] SYSTEM Menu"
echo -e " [\e[36m•2\e[0m] Wireguard Menu      [\e[36m•8\e[0m] Status Service"
echo -e " [\e[36m•3\e[0m] SSR & SS Menu       [\e[36m•9\e[0m] VPS Information"
echo -e " [\e[36m•4\e[0m] XRAY Menu           [\e[36m10\e[0m] Script Info"
echo -e " [\e[36m•5\e[0m] V2RAY Menu          [\e[36m11\e[0m] Clear RAM Cache"
echo -e " [\e[36m•6\e[0m] Trojan GFW Menu     [\e[31m12\e[0m] \e[31mREBOOT\033[0m"
echo -e   ""
echo -e   " Press x or [ Ctrl+C ] • To-Exit-Script"
echo -e   ""
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[33mClient Name    \E[0m: $Name"
echo -e " \e[33mScript Expired \E[0m: $Exp2"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e   ""
read -p " Select menu :  "  opt
echo -e   ""
case $opt in
1) clear ; m-sshovpn ;;
2) clear ; m-wg ;;
3) clear ; m-ss ;;
4) clear ; xray-menu ;;
5) clear ; v2ray-menu ;;
6) clear ; m-trojan ;;
7) clear ; m-system ;;
8) clear ; status ;;
9) clear ; vpsinfo ;;
10) clear ; info-menu ;;
11) clear ; clearcache ;;
12) clear ; reboot ;;
x) exit ;;
esac