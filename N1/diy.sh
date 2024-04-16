#!/bin/bash

# Default IP
sed -i 's/192.168.1.1/192.168.123.2/g' package/base-files/files/bin/config_generate

# Firewall
echo "iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE" >> package/network/config/firewall/files/firewall.user

# Remove packages
rm -rf feeds/luci/applications/luci-app-passwall

# Add packages
git clone https://github.com/JohnstonIrene/My-Pkg package/my-pkg
git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworld
git clone --depth=1 https://github.com/ophub/luci-app-amlogic package/amlogic
