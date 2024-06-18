#!/bin/sh

vconfig add green0 12
vconfig add green0 14
vconfig add green0 16


ifconfig green0.10 10.11.12.1 netmask 255.255.255.240 up
ifconfig green0.20 10.11.14.1 netmask 255.255.255.240 up
ifconfig green0.30 10.11.16.1 netmask 255.255.255.240 up

# Load network settings
. /var/ipfire/ethernet/settings

case "$1" in
 start)
        # Existing masquerade rule
        iptables -t nat -A POSTROUTING -o $RED_DEV -j MASQUERADE

        # Allow VLANs to access the outside network
        iptables -t nat -A POSTROUTING -o $RED_DEV -s 10.11.12.0/28 -j MASQUERADE
        iptables -t nat -A POSTROUTING -o $RED_DEV -s 10.11.14.0/28 -j MASQUERADE
        iptables -t nat -A POSTROUTING -o $RED_DEV -s 10.11.16.0/28 -j MASQUERADE
1
        # Allow traffic between VLANs
        iptables -I FORWARD -i green0.12 -o green0.14 -j ACCEPT
        iptables -I FORWARD -i green0.14 -o green0.12 -j ACCEPT
        iptables -I FORWARD -i green0.12 -o green0.16 -j ACCEPT
        iptables -I FORWARD -i green0.16 -o green0.12 -j ACCEPT
        iptables -I FORWARD -i green0.14 -o green0.16 -j ACCEPT
        iptables -I FORWARD -i green0.16 -o green0.14 -j ACCEPT
        ;;
 stop)
        ## add your 'stop' rules here

        # Remove custom rules
        iptables -t nat -D POSTROUTING -o $RED_DEV -s 10.11.12.0/28 -j MASQUERADE
        iptables -t nat -D POSTROUTING -o $RED_DEV -s 10.11.14.0/28 -j MASQUERADE
        iptables -t nat -D POSTROUTING -o $RED_DEV -s 10.11.16.0/28 -j MASQUERADE

        iptables -D FORWARD -i green0.12 -o green0.14 -j ACCEPT
        iptables -D FORWARD -i green0.14 -o green0.12 -j ACCEPT
        iptables -D FORWARD -i green0.12 -o green0.16 -j ACCEPT
        iptables -D FORWARD -i green0.16 -o green0.12 -j ACCEPT
        iptables -D FORWARD -i green0.14 -o green0.16 -j ACCEPT
        iptables -D FORWARD -i green0.16 -o green0.14 -j ACCEPT
        ;;
 restart)
        $0 stop
        $0 start
        ;;
 *)
        echo "Usage: $0 {start|stop|restart|reload}"
        exit 1
        ;;
esac

exit 0