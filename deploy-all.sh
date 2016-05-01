#!/bin/bash
./create-virtual-networks.sh
cd hiperium-identity/
vagrant up
cd ../hiperium-messaging/
vagrant up
