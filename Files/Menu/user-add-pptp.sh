#!/bin/bash
#Licensed to https://www.hostingtermurah.net/
#Script by PR Aiman

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
echo "Connecting to Server..."
sleep 0.4
echo "Checking Permision..."
sleep 0.3
CEK=PR Aiman
if [ "$CEK" != "PR Aiman" ]; then
		echo -e "${red}Permission Denied!${NC}";
        echo $CEK;
        exit 0;
else
echo -e "${green}Permission Accepted...${NC}"
sleep 1
clear
fi
if [ -e "/var/lib/premium-script" ]; then
		echo "continue..."
		clear
	else
		mkdir /var/lib/premium-script;
fi
read -p "        Username      : " username
grep -E "^$username" /etc/ppp/chap-secrets >/dev/null
if [ $? -eq 0 ]; then
echo "Username already exists in your VPS"
exit 0
else
read -p "        Password      : " password
read -p "        How many days?: " masa_aktif

today=`date +%s`
masa_aktif_detik=$(( $masa_aktif * 86400 ))
saat_expired=$(($today + $masa_aktif_detik))
tanggal_expired=$(date -u --date="1970-01-01 $saat_expired sec GMT" +%Y/%m/%d)
tanggal_expired_display=$(date -u --date="1970-01-01 $saat_expired sec GMT" '+%d %B %Y')
clear
echo "Connecting to Server..."
sleep 0.5
echo "Creating Account..."
sleep 0.5
echo "Generating Host..."
sleep 0.5
echo "Creating New PPTP Username: $username"
sleep 0.5
echo "Creating Password: $password"
sleep 0.5
MYIP=$(wget -qO- ipv4.icanhazip.com)
echo "$username	*	$password	*" >> /etc/ppp/chap-secrets
echo "$username *   $password   *  $saat_expired"  >> /var/lib/premium-script/data-user-pptp
  clear
  echo ""
  echo ""
  echo ""
  echo "--------------------------------------"
  echo "          PPTP Account Details        "
  echo "--------------------------------------"
  echo "   Host          : $MYIP"
  echo "   Username      : $username"
  echo "   Password      : $password"
  echo "   Date Expired  : $tanggal_expired_display"
  echo "--------------------------------------"
  echo " "
  echo " "
fi