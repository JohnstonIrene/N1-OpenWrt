#!/bin/bash

# Default IP
sed -i 's/192.168.1.1/192.168.123.2/g' package/base-files/files/bin/config_generate

# Firewall
echo "iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE" >> package/network/config/firewall/files/firewall.user

# Add packages
git clone https://github.com/ophub/luci-app-amlogic --depth=1 package/amlogic

# Update packages
mv package/amlogic/luci-app-amlogic feeds/luci/applications/

# Clean packages
rm -rf package/amlogic