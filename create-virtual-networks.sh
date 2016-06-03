#!/bin/bash
# This script creates all network interfaces for Hiperium Project Domains.
set -e
echo "Create Hiperium Identity Virtual Network"
VBoxManage hostonlyif create
VBoxManage hostonlyif ipconfig "vboxnet5" --ip 172.16.76.128 --netmask 255.255.255.240

echo "Create Hiperium Device Virtual Network"
VBoxManage hostonlyif create
VBoxManage hostonlyif ipconfig "vboxnet6" --ip 172.16.76.144 --netmask 255.255.255.240

echo "Create Hiperium Logging Virtual Network"
VBoxManage hostonlyif create
VBoxManage hostonlyif ipconfig "vboxnet7" --ip 172.16.76.160 --netmask 255.255.255.240

echo "Create Hiperium Messaging Virtual Network"
VBoxManage hostonlyif create
VBoxManage hostonlyif ipconfig "vboxnet8" --ip 172.16.76.176 --netmask 255.255.255.240
