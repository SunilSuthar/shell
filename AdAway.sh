#!/bin/sh
#==================================================
# AdAway shell
#==================================================


# Start
apply_hosts() {

	cd "/etc/"
	 # backup hosts file before applying new one
    if [ ! -f "hosts.bak" ]; then
        sudo mv hosts hosts.bak
    fi

    sudo wget -O hosts "http://winhelp2002.mvps.org/hosts.txt"
}

# Restore back up hosts file
restore() {
    # check if backup exist then use it else create backup
    if [ -f "/etc/hosts.bak" ]; then
        sudo mv /etc/hosts.bak /etc/hosts
        echo "Restore complete!"
    else
        echo "Restore failed no backup found!"
    fi
}

# Main menu
menu() {
    printf "==================================================\n"
    printf "=                AdAway Shell                    =\n"
    printf "==================================================\n"
    printf "= 1. Apply host sources                          =\n"
    printf "= 2. Restore original hosts file                 =\n"
    printf "==================================================\n"
    printf "choice: "
    read choice
    if [ "$choice" -eq 1 ]; then
        apply_hosts
    elif [ "$choice" -eq 2 ]; then
        restore
    else
        echo 'Bye!'
        exit 0
    fi
}

# clear the screen
clear

# Launch menu
menu