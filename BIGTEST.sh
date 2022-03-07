#!/bin/vbash
source /opt/vyatta/etc/functions/script-template


set firewall name DMZ-WAN rule 10 action 'accept'
set firewall name DMZ-WAN rule 10 destination port '123'


exit
