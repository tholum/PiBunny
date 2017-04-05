leasefile="/var/lib/dhcp/dhcpd.leases"
export TARGET_IP=$(cat $leasefile | grep ^lease | awk '{ print $2 }' | sort | uniq)
export TARGET_HOSTNAME=$(cat $leasefile | grep hostname | awk '{print $2 }' \
		| sort | uniq | tail -n1 | sed "s/^[ \t]*//" | sed 's/\"//g' | sed 's/;//')
export HOST_IP="172.16.64.1"

export SWITCH_POSITION="switch1"
