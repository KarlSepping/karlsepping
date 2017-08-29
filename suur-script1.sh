#!/bin/bash

# Check OS Typee
os=$(uname -o)
echo -e "Operating System Type :" $os

# Check OS Release Version and Name
cat /etc/os-release | grep 'NAME\|VERSION' | grep -v 'VERSION_ID' | grep -v 'PRETTY_NAME' > /tmp/osrelease
echo -n -e "OS Name :" $tecreset  && cat /tmp/osrelease | grep -v "VERSION" | cut -f2 -d\"
echo -n -e "OS Version :" $tecreset && cat /tmp/osrelease | grep -v "NAME" | cut -f2 -d\"

# Check Architecture
architecture=$(uname -m)
echo -e "Architecture :" $architecture

# Check Kernel Release
kernelrelease=$(uname -r)
echo -e "Kernel Release :" $kernelrelease

#Check cores
cpucores=$(nproc --all)
echo -e "Cores :" $cpucores

# Check hostname
echo -e "Hostname :" $HOSTNAME

# Check Internal IP
internalip=$(hostname -i)
echo -e "Internal IP :" $internalip

# Check External IP
externalip=$(curl -s ipecho.net/plain;echo)
echo -e "External IP : "$externalip

# Check RAM and SWAP Usages
free -h | grep -v + > /tmp/ramcache
echo -e "Ram Usages :"
echo -e "Swap Usages :"
cat /tmp/ramcache | grep -v "Mem"

# Check Disk Usages
df -h| grep 'Filesystem\|/dev/sda*' > /tmp/diskusage
echo -e "Disk Usages :"
cat /tmp/diskusage

# Unset Variables
unset tecreset os architecture kernelrelease internalip externalip nameserver loadaverage

# Remove Temporary Files
rm /tmp/osrelease /tmp/ramcache /tmp/diskusage

