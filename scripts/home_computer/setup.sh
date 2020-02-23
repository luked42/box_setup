#!/bin/bash

# Remove password and make access to sudo easy
sudo sh -c "echo $(whoami) ALL=\(ALL\) NOPASSWD:ALL >> /etc/sudoers"

sudo yum install -y gcc
sudo yum install -y automake

sudo yum install -y bison
