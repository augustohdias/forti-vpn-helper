#!/bin/bash

## Created by Augusto Dias (https://github.com/augustohdias)
## Friendly OpenFortiVPN interactive helper
## "The philosophers have only interpreted the world in various ways; the point, however, is to change it."

setUser() {
	usr=$VPN_USER
}

setHost() {
	usr=$VPN_HOST
}

askPassword() {
	echo "[vpn] VPN Password:"
	read -s pass
}

askUser() {
	echo "User environment variable is not set. You can skip this prompt by setting the variable \$VPN_USER in your environment."
	echo "[vpn] VPN User:"
	read usr
}

askHost() {
	echo "Host environment variable is not set. You can skip this prompt by setting the variable \$VPN_HOST in your environment."
	echo "[vpn] VPN host (<host>:<port>):"
	read host
}

vpnCommand() {
	sudo openfortivpn $host -u $usr -p $pass $1 $2
}

tryConnect() {
	echo "$(vpnCommand)"
}

connect() {
        certificate=$(egrep -m1 -o "\-\-trusted-cert .+" <<< "$(tryConnect)") 
	vpnCommand $certificate
}

# Main script

[[ -z $VPN_USER ]] && askUser || setUser

askPassword

[[ -z $VPN_USER ]] && askHost || setHost

connect | grep -v WARN:
