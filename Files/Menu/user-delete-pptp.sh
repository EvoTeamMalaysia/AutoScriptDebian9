#!/bin/bash
#Licensed to https://www.hostingtermurah.net/
#Script by PR Aiman

red='\e[1;31m'
blue='\e[1;34m'
green='\e[0;32m'
NC='\e[0m'
echo "Connecting to Server..."
sleep 0.4
echo "Checking Permision..."
sleep 0.4
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

read -p "Input Username you want to delete: " username
grep -E "^$username" /etc/ppp/chap-secrets >/dev/null
if [ $? -eq 0 ]; then
# changing the password
username2="/$username/d";
sed -i $username2 /etc/ppp/chap-secrets
sed -i $username2 /var/lib/premium-script/data-user-pptp
sed -i '/^$/d' /etc/ppp/chap-secrets
sed -i '/^$/d' /var/lib/premium-script/data-user-pptp
clear
  echo " "
  echo " "
  echo " "
  echo "-----------------------------------------------"
  echo -e "Username ${blue}$username${NC} successfully ${red}REMOVED${NC}."
  echo -e "Login access for Username ${blue}$username${NC} has been deleted"
  echo "-----------------------------------------------"
else
echo "Username not found on your server"
    exit 1
fi