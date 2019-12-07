#!/bin/bash
# Created by http://www.vps-murah.net
# Modified by PR Aiman

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
echo "echo "Script Created By PR Aiman"" > /usr/local/bin/infouser-pptp
echo "echo "Script Created By PR Aiman"" > /usr/local/bin/expireduser-pptp
chmod +x /usr/local/bin/infouser-pptp
chmod +x /usr/local/bin/expireduser
chmod +x /etc/ppp/chap-secrets
chmod +x /var/lib/premium-script/data-user-pptp

totalaccounts=`cat /var/lib/premium-script/data-user-pptp | wc -l`
for((i=1; i<=$totalaccounts; i++ ))
       do       
       username=`cat /var/lib/premium-script/data-user-pptp | awk '{print $1}' | head -n $i | tail -n 1`
       userexpireinseconds=`cat /var/lib/premium-script/data-user-pptp | awk '{print $5}' | head -n $i | tail -n 1`
       tglexp=`date -d @$userexpireinseconds`             
       tgl=`echo $tglexp|awk -F" " '{print $3}'`
       bulantahun=`echo $tglexp |awk -F" " '{print $2,$6}'`
       todaystime=`date +%s`
	   seeder=s/^$username/#$username/g
       if [ $userexpireinseconds -ge $todaystime ] ;
           then
           timeto7days=$(( $todaystime + 604800 ))
                if [ $userexpireinseconds -le $timeto7days ];
                then                     
                     echo "echo "User : $username will expired on : $tgl $bulantahun"" >> /usr/local/bin/infouser-pptp
                fi
       else
       echo "echo "User : $username expired on date : $tgl $bulantahun"" >> /usr/local/bin/expireduser-pptp
	   sed -i $seeder /var/lib/premium-script/data-user-pptp
	   sed -i $seeder /etc/ppp/chap-secrets
	   sed -i "s|##|#|g" /etc/ppp/chap-secrets
	   sed -i "s|###|#|g" /etc/ppp/chap-secrets
	   sed -i "s|####|#|g" /etc/ppp/chap-secrets
	   sed -i "s|#####|#|g" /etc/ppp/chap-secrets
	   sed -i "s|######|#|g" /etc/ppp/chap-secrets
	   sed -i "s|#######|#|g" /etc/ppp/chap-secrets
	   sed -i "s|########|#|g" /etc/ppp/chap-secrets
	   sed -i "s|#########|#|g" /etc/ppp/chap-secrets
	   sed -i "s|##########|#|g" /etc/ppp/chap-secrets
	   sed -i "s|###########|#|g" /etc/ppp/chap-secrets
	   sed -i "s|############|#|g" /etc/ppp/chap-secrets
	   sed -i "s|#############|#|g" /etc/ppp/chap-secrets
	   sed -i "s|##############|#|g" /etc/ppp/chap-secrets
	   sed -i "s|###############|#|g" /etc/ppp/chap-secrets
	   sed -i "s|################|#|g" /etc/ppp/chap-secrets
	   sed -i "s|#################|#|g" /etc/ppp/chap-secrets
	   sed -i "s|##|#|g" /var/lib/premium-script/data-user-pptp
	   sed -i "s|###|#|g" /var/lib/premium-script/data-user-pptp
	   sed -i "s|####|#|g" /var/lib/premium-script/data-user-pptp
	   sed -i "s|#####|#|g" /var/lib/premium-script/data-user-pptp
	   sed -i "s|######|#|g" /var/lib/premium-script/data-user-pptp
	   sed -i "s|#######|#|g" /var/lib/premium-script/data-user-pptp
	   sed -i "s|########|#|g" /var/lib/premium-script/data-user-pptp
	   sed -i "s|#########|#|g" /var/lib/premium-script/data-user-pptp
	   sed -i "s|##########|#|g" /var/lib/premium-script/data-user-pptp
	   sed -i "s|###########|#|g" /var/lib/premium-script/data-user-pptp
	   sed -i "s|############|#|g" /var/lib/premium-script/data-user-pptp
	   sed -i "s|#############|#|g" /var/lib/premium-script/data-user-pptp
	   sed -i "s|##############|#|g" /var/lib/premium-script/data-user-pptp
	   sed -i "s|###############|#|g" /var/lib/premium-script/data-user-pptp
	   sed -i "s|################|#|g" /var/lib/premium-script/data-user-pptp
	   sed -i "s|#################|#|g" /var/lib/premium-script/data-user-pptp
       fi
done
  echo " "
  echo " "
  echo " "
    echo "---------------------------------------------"
  echo -e "The expired PPTP VPN user has been locked"
  echo -e "Login access for username has beenlocked"
  echo "-----------------------------------------------"