#!/bin/bash

# run dhcpd on interface "$1"

if ! -e /cfg/dhcpd.leases ] ; then 
   echo "/cfg/dhcpd.leases does not exists" >> /logs/dhcp.dlog 2>&1
   echo "touch /cfg/dhcpd.leases " >> /logs/dhcp.dlog 2>&1
   touch /cfg/dhcpd.leases
fi

/usr/sbin/dhcpd -user dhcpd -group dhcpd -4 -f -d  --no-pid -cf "/cfg/dhcpd.conf" -lf "/cfg/dhcpd.leases" $1 >> /logs/dhcp.dlog 2>&1

