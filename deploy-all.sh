#!/bin/bash
set -e
./create-virtual-networks.sh
echo "Create Identity Domain"
cd hiperium-identity/
./deploy-domain.sh
