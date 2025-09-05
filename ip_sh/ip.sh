#!/bin/bash

green() { echo -e "\033[32m$1\033[0m"; }
yellow() { echo -e "\033[33m$1\033[0m"; }
red() { echo -e "\033[31m$1\033[0m"; }

ip1=$(curl -s https://api.ipify.org)                # Cloudflare (via ipify.org)
ip2=$(curl -s https://ifconfig.me)                  # ifconfig.me
ip3=$(curl -s https://ipinfo.io/ip)                 # ipinfo.io
ip4=$(curl -s https://checkip.amazonaws.com)        # AWS
ip5=$(curl -s https://icanhazip.com)                # icanhazip.com
ip6=$(curl -s https://whatismyip.akamai.com)        # Akamai
ip7=$(curl -s https://ident.me)                     # ident.me
ip8=$(curl -s https://myexternalip.com/raw)         # myexternalip.com
ip9=$(curl -s https://ipecho.net/plain)             # ipecho.net
ip10=$(curl -s https://ipv4.icanhazip.com)          # Forces IPv4
ip11=$(curl -s https://ipv6.icanhazip.com)          # Forces IPv6
ip12=$(curl -s https://wtfismyip.com/text)          # wtfismyip.com
ip13=$(curl -s https://ip.42.pl/raw)                # Polish simple IP service
ip14=$(curl -s https://ip.seeip.org)                # seeip.org
ip15=$(curl -s https://ipecho.io/plain)             # ipecho.io
ip16=$(curl -s https://trackip.net/ip)              # trackip.net
ip17=$(curl -s https://ipwho.is/?format=raw | grep ip | cut -d\" -f4) # ipwho.is
ip18=$(curl -s https://get.geojs.io/v1/ip)          # geojs.io

ips=("$ip1" "$ip2" "$ip3" "$ip4" "$ip5" "$ip6" "$ip7" "$ip8" "$ip9"  "$ip9"  "$ip10"  "$ip11"  "$ip12"  "$ip13"  "$ip14"  "$ip15"  "$ip16"  "$ip17"  "$ip18")

declare -A cnt
for ip in "${ips[@]}"; do

	if [[ -n "$ip" ]]; then
        	((cnt["$ip"]++))
	fi
done

max_ip=""
max_ip_count=0
total_count=${#ips[@]}

for ip in "${!cnt[@]}"; do
	if [[ ${cnt[$ip]} -gt $max_ip_count ]]; then
		max_ip_count=${cnt[$ip]}
		max_ip=$ip
	fi
done

if  [[ $total_count -ne 0 ]]; then
	percentage=$((100 * max_ip_count / total_count))
else
	percentage=0
fi

if [[ $max_ip_count -eq $total_count ]]; then
	green "All sources Match! IP: $max_ip"
elif [[ $percentage -ge 50 ]]; then
	yellow "Majority match ($percentage%) IP: $max_ip"
else
	red "Low consensus (<50%) -Most Common IP ($percentage%): $max_ip"
fi




