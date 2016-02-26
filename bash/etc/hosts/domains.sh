#!/bin/bash 

address="0.0.0.0"

## 
# Show usage
#
function usage {
    echo "You tried: > ${0##*/} $@ "
    echo "Usage:     > ${0##*/} (block|unblock) the.domain.com"
    echo "ex.        > ${0##*/} block www.twitter.com"
    echo 
    cat /etc/hosts
    
    exit
}

##
# "Blocks" hostname from resolving outside of computer
#
function block {
    echo "Blocking $1"
    echo "$address	$1" >> /etc/hosts
}

##
# Unblocks hostname. Requires address+domain to match to be careful.
#
function unblock {
     echo "Unblocking $1"
     cat /etc/hosts | egrep -v "$address\s+\Q$1\E" > /etc/hosts.tmp
     mv /etc/hosts.tmp /etc/hosts
}

##
# Gives you a fighting chance to fix it
#
function backup {
     echo "Backing up /etc/hosts -> /etc/hosts.orig"
     cp /etc/hosts /etc/hosts.orig
}

# Check inputs
if [ "$#" -ne 2 ]
then 
    usage $@
fi


backup

# Switch commands
if [ "$1" = "block" ]
then
    block $2
elif [ "$1" = "unblock" ]
then 
    unblock $2
else
    usage
fi

echo
cat /etc/hosts
