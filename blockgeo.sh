#/bin/bash

IPTABLES=/sbin/iptables
#adjust to point to the correct location of these files
#CHINA=/usr/local/etc/iptables/china.ips
CHINA=./china.ips
#ARGENTINA=/usr/local/etc/iptables/argentina.ips
ARGENTINA=./argentina.ips

#china
${IPTABLES} -X china 
${IPTABLES} -N china 

echo "Block China"
while read ip; do
   #echo "Block ip $ip"
   ${IPTABLES} -A china -p all -s $ip -j DROP
done <$CHINA


#argentina
${IPTABLES} -X argentina
${IPTABLES} -N argentina

echo "Block Argentina"
while read ip; do
   #echo "Block ip $ip"
   ${IPTABLES} -A argentina -p all -s $ip -j DROP
done <$ARGENTINA



