#!/bin/bash

# oldlocaluser - One that needs removing
# adminuser - your username
# newuser - your new staff memeber

if [ -f server.txt ]; then

        for server in $(cat server.txt); do
                ssh -t adminuser@$server  '
                if [ -d /home/oldlocaluser ]; then
                        sudo rm -rf /home/oldlocaluser
                        sudo deluser oldlocaluser
                        sudo adduser newuser --disabled-password --gecos "" --force-badname
                elif
                        [ -d /home/newuserl ]; then
                        echo "User is already here - nothing to do"
                else
                        echo "#### Revisit - something has gone screwy ####"

                fi'
        done
else
        echo 'No server.txt file'
fi
