#echo "Clearing iptables"
#sleep 0.5
#iptables -F
#clear

echo "Opening TCP port 80 & 22"
sleep 0.5
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
clear

echo "Block TraceRoute : ppp0 wlan0 eth0 lo ..."
sleep 0.5
iptables -A INPUT -p udp -s 0/0 -i $interface --dport 33435:33525 -j DROP
clear

echo "Block TCP-CONNECT scan attempts (SYN bit packets)"
sleep 0.5
iptables -A INPUT -p tcp --syn -j DROP
clear

echo "Block TCP-SYN scan attempts (only SYN bit packets)"
sleep 0.5
iptables -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH SYN -j DROP
clear

echo "Block TCP-FIN scan attempts (only FIN bit packets)"
sleep 0.5
iptables -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH FIN -j DROP
clear

echo "Block TCP-ACK scan attempts (only ACK bit packets)"
sleep 0.5
iptables -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH ACK -j DROP
clear

echo "Block TCP-NULL scan attempts (packets without flag)"
sleep 0.5
iptables -A INPUT -m conntrack --ctstate INVALID -p tcp --tcp-flags ! SYN,RST,ACK,FIN,URG,PSH SYN,RST,ACK,FIN,URG,PSH -j DROP
clear

echo "Block Christmas TreeTCP-XMAS scan attempts (packets with FIN, URG, PSH bits)"
sleep 0.5
iptables -A INPUT -m conntrack --ctstate NEW -p tcp --tcp-flags SYN,RST,ACK,FIN,URG,PSH FIN,URG,PSH -j DROP
clear

echo "Block DOS - Ping of Death"
sleep 0.5
iptables -A INPUT -p ICMP --icmp-type echo-request -m length --length 60:65535 -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type echo-request -m connlimit --connlimit 1/s -j accept
iptables -A FORWARD -p icmp --icmp-type echo-request -j DROP
clear

echo "Block DOS - Teardrop"
sleep 0.5
iptables -A INPUT -p UDP -f -j DROP
clear

echo "Block DDOS - SYN-flood"
sleep 0.5
iptables -A INPUT -p TCP --syn -m connlimit --connlimit-above 9 -j DROP
clear

echo "Block DDOS - Smurf"
sleep 0.5
iptables -A INPUT -m pkttype --pkt-type broadcast -j DROP
iptables -A INPUT -p ICMP --icmp-type echo-request -m pkttype --pkttype broadcast -j DROP
iptables -A INPUT -p ICMP --icmp-type echo-request -m limit --limit 3/s -j ACCEPT
iptables -A INPUT -p icmp -m icmp --icmp-type address-mask-request -j DROP
iptables -A INPUT -p icmp -m icmp --icmp-type timestamp-request -j DROP
iptables -A INPUT -p icmp -m icmp -m limit --limit 1/second -j ACCEPT
clear

echo "Block DDOS - UDP-flood (Pepsi)"
sleep 0.5
iptables -A INPUT -p UDP --dport 7 -j DROP
iptables -A INPUT -p UDP --dport 19 -j DROP
clear

echo "Block DDOS - SMBnuke"
sleep 0.5
iptables -A INPUT -p UDP --dport 135:139 -j DROP
iptables -A INPUT -p TCP --dport 135:139 -j DROP
clear

echo "Block DDOS - Connection-flood"
sleep 0.5
iptables -A INPUT -p TCP --syn -m connlimit --connlimit-above 3 -j DROP
clear

echo "Block DDOS - Fraggle"
sleep 0.5
iptables -A INPUT -p UDP -m pkttype --pkt-type broadcast -j DROP
iptables -A INPUT -p UDP -m limit --limit 3/s -j ACCEPT
clear

echo "Block DDOS - Jolt"
sleep 0.5
iptables -A INPUT -p ICMP -f -j DROP
clear

echo "Block NetBus"
sleep 0.5
iptables -A INPUT -p tcp --dport 12345:12346 -j DROP
iptables -A INPUT -p udp --dport 12345:12346 -j DROP 
clear

echo "Against Port Scanners"
sleep 0.5
iptables -A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s -j ACCEPT
echo "Block Back Orifice"
iptables -A INPUT -p tcp --dport 31337 -j DROP
iptables -A INPUT -p udp --dport 31337 -j DROP
clear

echo "Fragmented / invalid Packet Blocking"
sleep 0.5
#iptables -A INPUT -i $interface -m unclean -j log_unclean
#iptables -A INPUT -f -i $interface -j log_fragment
iptables -A INPUT -m state --state INVALID -j DROP
iptables -A FORWARD -m state --state INVALID -j DROP
iptables -A OUTPUT -m state --state INVALID -j DROP
clear

echo "Protection against attacks"
sleep 0.5
iptables -A INPUT -m state --state INVALID -j DROP
clear

echo "Block of Some TTLs |g3m|T50"
sleep 0.5
iptables -I INPUT -p icmp -i $interface -m ttl --ttl-gt 160 -j DROP
iptables -I INPUT -p udp -i $interface -m ttl --ttl-gt 160 -j DROP
iptables -I INPUT -p tcp -i $interface -m ttl --ttl-gt 160 -j DROP
clear

echo "Drop excessive RST packets to avoid smurf attacks"
sleep 0.5
iptables -A INPUT -p tcp -m tcp --tcp-flags RST RST -m limit --limit 2/second --limit-burst 2 -j ACCEPT
clear

echo "slowloris mitigation"
sleep 0.5
iptables -I INPUT -p tcp -m state --state NEW --dport 80 -m recent \
--name slowloris --set
iptables -I INPUT -p tcp -m state --state NEW --dport 80 -m recent \
--name slowloris --update --seconds 15 --hitcount 10 -j DROP
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
clear

echo "block icmp"
sleep 0.5
iptables -I INPUT -p ICMP --icmp-type 8 -j REJECT
iptables -A OUTPUT -p icmp --icmp-type echo-request -j DROP
iptables -A OUTPUT -p icmp --icmp-type 8 -j DROP
clear

echo "Block ping requests"
sleep 0.5
iptables -I INPUT -i ech0 -p icmp -s 0/0 -d 0/0 -j DROP
iptables -I INPUT -i ech0 -p icmp -s 0/0 -d 0/0 -j ACCEPT
iptables -I INPUT -p icmp --icmp-type 8 -j DROP
clear

echo "Saving iptables and finishing touches"
sleep 0.5
#iptables-save > /etc/iptables.rules 	# for archlinux
iptables-save > /etc/rules.v4 	# for Debian/ubuntu base OS
clear
echo "Whoo! your done finally you can now feel safe!"
read -p "press [ENTER] to exit"

