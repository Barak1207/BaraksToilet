#!/bin/bash

iptables -F INPUT #Delete all input rules
ip6tables -F INPUT #Delete all input rules v6

iptables -A INPUT -s 127.0.0.0/8 -j ACCEPT 	#Accept lo
iptables -A INPUT -s 10.0.0.0/24 -j ACCEPT 	#Accept wlan0
iptables -A INPUT -s 192.168.0.0/24 -j ACCEPT  #Accept wlan0

iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT   #Aceept outgoing but established already. (apt-get and such)


#Accept ISR ips http://www.nirsoft.net/countryip/il.html

iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 79.176.0.0-79.183.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 2.52.0.0-2.55.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 77.124.0.0-77.127.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 84.108.0.0-84.111.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 87.68.0.0-87.71.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 109.64.0.0-109.67.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 176.228.0.0-176.231.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 46.116.0.0-46.117.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 46.120.0.0-46.121.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 80.178.0.0-80.179.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 82.80.0.0-82.81.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 84.94.0.0-84.95.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 84.228.0.0-84.229.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 85.64.0.0-85.65.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 89.138.0.0-89.139.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 93.172.0.0-93.173.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 5.29.0.0-5.29.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 31.154.0.0-31.154.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 31.168.0.0-31.168.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 37.142.0.0-37.142.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 46.210.0.0-46.210.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 62.0.0.0-62.0.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 62.90.0.0-62.90.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 62.219.0.0-62.219.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 80.230.0.0-80.230.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 81.218.0.0-81.218.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 82.166.0.0-82.166.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 83.130.0.0-83.130.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 85.250.0.0-85.250.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 95.35.0.0-95.35.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 109.186.0.0-109.186.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 109.253.0.0-109.253.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 128.139.0.0-128.139.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 132.64.0.0-132.64.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 132.65.0.0-132.65.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 132.66.0.0-132.66.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 132.67.0.0-132.67.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 132.68.0.0-132.68.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 132.69.0.0-132.69.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 132.70.0.0-132.70.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 132.71.0.0-132.71.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 132.72.0.0-132.72.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 132.73.0.0-132.73.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 132.74.0.0-132.74.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 132.75.0.0-132.75.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 132.76.0.0-132.76.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 132.77.0.0-132.77.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 132.78.0.0-132.78.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 138.134.0.0-138.134.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 141.226.0.0-141.226.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 147.161.0.0-147.161.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 147.233.0.0-147.233.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 147.234.0.0-147.234.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 147.235.0.0-147.235.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 147.236.0.0-147.236.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 147.237.0.0-147.237.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 149.49.0.0-149.49.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 176.13.0.0-176.13.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 192.115.0.0-192.115.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 192.118.0.0-192.118.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 212.143.0.0-212.143.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 212.150.0.0-212.150.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 213.8.0.0-213.8.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 213.57.0.0-213.57.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 217.132.0.0-217.132.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 192.116.0.0-192.116.191.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 85.130.128.0-85.130.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 94.159.128.0-94.159.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 94.188.128.0-94.188.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 109.160.128.0-109.160.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 176.12.128.0-176.12.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 192.117.0.0-192.117.127.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 194.90.128.0-194.90.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 212.179.0.0-212.179.127.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 212.179.128.0-212.179.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 212.199.0.0-212.199.127.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 212.199.128.0-212.199.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 192.114.0.0-192.114.83.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 192.114.88.0-192.114.159.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 5.28.128.0-5.28.191.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 5.102.192.0-5.102.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 81.5.0.0-81.5.63.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 82.102.128.0-82.102.191.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 95.86.64.0-95.86.127.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 109.226.0.0-109.226.63.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 192.114.192.0-192.114.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 192.116.192.0-192.116.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 192.117.128.0-192.117.191.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 192.117.192.0-192.117.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 194.90.64.0-194.90.127.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 212.235.0.0-212.235.63.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 212.235.64.0-212.235.127.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 62.128.32.0-62.128.63.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 92.240.0.0-92.240.31.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 93.175.32.0-93.175.63.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 95.175.32.0-95.175.63.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 188.120.128.0-188.120.159.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 192.114.160.0-192.114.191.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 194.90.0.0-194.90.31.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 194.90.32.0-194.90.63.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 212.25.64.0-212.25.95.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 212.25.96.0-212.25.127.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 212.29.192.0-212.29.223.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 212.29.224.0-212.29.255.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 212.68.128.0-212.68.159.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 212.76.96.0-212.76.127.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 212.116.160.0-212.116.191.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 212.117.128.0-212.117.159.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 213.151.32.0-213.151.63.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 213.184.96.0-213.184.127.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 5.144.48.0-5.144.63.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 31.44.128.0-31.44.143.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 31.210.176.0-31.210.191.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 37.19.112.0-37.19.127.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 37.46.32.0-37.46.47.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 46.228.144.0-46.228.159.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 80.70.128.0-80.70.143.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 80.74.96.0-80.74.111.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 80.74.112.0-80.74.127.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 80.244.160.0-80.244.175.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 80.246.128.0-80.246.143.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 80.250.144.0-80.250.159.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 91.90.128.0-91.90.143.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 91.135.96.0-91.135.111.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 91.143.224.0-91.143.239.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 92.61.224.0-92.61.239.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 94.230.80.0-94.230.95.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 95.142.16.0-95.142.31.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 164.138.112.0-164.138.127.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 194.29.32.0-194.29.47.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 217.22.112.0-217.22.127.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 217.65.32.0-217.65.47.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 217.194.192.0-217.194.207.255 -j ACCEPT
iptables -A INPUT -p tcp --match multiport --dports 443,80 -m iprange --src-range 46.19.85.59-46.19.255.255 -j ACCEPT





iptables -A INPUT -j DROP #DROP all
ip6tables -A INPUT -j DROP #Drop all IPv6

/etc/init.d/netfilter-persistent save #Save for persistant Iptables http://blog.mxard.com/persistent-iptables-on-raspberry-pi-raspbian
