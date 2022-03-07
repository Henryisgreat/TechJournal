#!/bin/vbash
source /opt/vyatta/etc/functions/script-template

# set up LAN to WAN rules 
configure
set firewall name LAN-WAN default-action drop
set firewall name LAN-WAN enable-default-log
set firewall name LAN-WAN rule 1 action accept
commit 
save

# set up WAN to LAN rules
configure
set firewall name WAN-LAN default-action drop
set firewall name WAN-LAN enable-default-log
set firewall name WAN-LAN rule 1 action accept
commit 
save


# Allow logs from web01 to log server DMZ-LAN
configure
set firewall name DMZ-LAN default-action drop
set firewall name DMZ-LAN enable-default-log
set firewall name DMZ-LAN rule 10 action accept
set firewall name DMZ-LAN rule 10 destination port 1514
set firewall name DMZ-LAN rule 10 protocol udp
set firewall name DMZ-LAN rule 20 action accept
set firewall name DMZ-LAN rule 20 state established enable
commit
save


exit
