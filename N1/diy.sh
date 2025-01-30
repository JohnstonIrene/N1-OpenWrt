#!/bin/bash

# Default IP
sed -i 's/192.168.1.1/192.168.123.2/g' package/base-files/files/bin/config_generate

# Add packages
git clone https://github.com/ophub/luci-app-amlogic --depth=1 package/amlogic
git clone https://github.com/xiaorouji/openwrt-passwall --depth=1 package/passwall

# Update packages
cp -fr package/amlogic/luci-app-amlogic package/passwall/luci-app-passwall feeds/luci/applications/

# Clean packages
rm -rf package/amlogic package/passwall