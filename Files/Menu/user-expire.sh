#!/bin/bash
#Licensed to https://www.hostingtermurah.net/
#Script by PR Aiman

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
echo "Connecting to Server..."
sleep 0.5
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
echo "echo "Script Created By PR Aiman"" > /usr/local/bin/infouser
echo "echo "Script Created By PR Aiman"" > /usr/local/bin/expireduser
echo "echo "Script Created By PR Aiman"" > /usr/local/bin/alluser
chmod +x /usr/local/bin/infouser
chmod +x /usr/local/bin/expireduser
chmod +x /usr/local/bin/alluser

cat /etc/shadow | cut -d: -f1,8 | sed /:$/d > /tmp/expirelist.txt
totalaccounts=`cat /tmp/expirelist.txt | wc -l`
for((i=1; i<=$totalaccounts; i++ ))
       do
       tuserval=`head -n $i /tmp/expirelist.txt | tail -n 1`
       username=`echo $tuserval | cut -f1 -d:`
       userexp=`echo $tuserval | cut -f2 -d:`
       userexpireinseconds=$(( $userexp * 86400 ))
       tglexp=`date -d @$userexpireinseconds`             
       tgl=`echo $tglexp |awk -F" " '{print $3}'`
       while [ ${#tgl} -lt 2 ]
       do
           tgl="0"$tgl
       done
       while [ ${#username} -lt 15 ]
       do
           username=$username" " 
       done
       bulantahun=`echo $tglexp |awk -F" " '{print $2,$6}'`
       echo "echo "User : $username expired on : $tgl $bulantahun"" >> /usr/local/bin/alluser
       todaystime=`date +%s`
       if [ $userexpireinseconds -ge $todaystime ] ;
           then
           timeto7days=$(( $todaystime + 604800 ))
                if [ $userexpireinseconds -le $timeto7days ];
                then                     
                     echo "echo "User : $username expired on date : $tgl $bulantahun"" >> /usr/local/bin/infouser
                fi
       else
       echo "echo "User : $username expired on : $tgl $bulantahun"" >> /usr/local/bin/expireduser
       passwd -l $username
       fi
done