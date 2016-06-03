#!/bin/bash
# Deploy the entire environment with S.O. configurations.
set -e
./install-vagrant.sh
./create-virtual-networks.sh
./deploy-domains.sh
