#!/bin/bash
# This script creates all libvirt network for all Hiperium Services

echo "Create Hiperium Identity Virtual Network"
VBoxManage hostonlyif create
VBoxManage hostonlyif ipconfig "vboxnet1" --ip 172.16.76.0 --netmask 255.255.255.240

echo "Create Hiperium Control Messaging Virtual Network"
VBoxManage hostonlyif create
VBoxManage hostonlyif ipconfig "vboxnet2" --ip 172.16.76.16 --netmask 255.255.255.240
