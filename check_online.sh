source hardware.list

for ip in  "${ip_addresses[@]}"
do
    ping -c 1 $ip
done

