#!/bin/bash

set -e

vagrant up
ansible-playbook ansible/prod.yml -i ansible/hosts
