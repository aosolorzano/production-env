#!/bin/bash
./create-virtual-networks.sh
echo "Creating Identity Domain ..."
cd hiperium-identity/
./deploy-domain.sh
