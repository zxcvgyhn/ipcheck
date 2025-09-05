#!/bin/bash

green() { echo -e "\033[32m$1\033[0m"; }
yellow() { echo -e "\033[33m$1\033[0m"; }
red() { echo -e "\033[31m$1\033[0m"; }

ip1=$(curl -s http://ipinfo.io/ip)
echo $ip1
ip2=$(curl -s http://ifconfig.me)
echo $ip2
ip3=$(curl -s http://checkip.amazonaws.com)
echo $ip3
ip4=$(curl -s http://icanhazip.com)
echo $ip4
ip5=$(curl -s http://whatismyip.akamai.com)
echo $ip5
ip6=$(curl -s http://ident.me)
echo $ip6
ip7=$(curl -s http://myexternalip.com/raw)
echo $ip7 
ip8=$(curl -s https://api.ipify.org)
echo $ip8
ip10=$(curl -s http://ipecho.net/plain)
echo $ip10

ips=("$ip1" "$ip2" "$ip3" "$ip4" "$ip5" "$ip6" "$ip7" "$ip8" "$ip9" "$ip10")

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




