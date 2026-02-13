#!/bin/bash

# Adjust source code
patch -p1 -f < $(dirname "$0")/luci.patch

# getready
rm -rf clone
mkdir -p clone

# clone 
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
git clone https://github.com/ophub/luci-app-amlogic --depth=1 clone/amlogic
git clone https://github.com/sbwml/luci-app-mosdns -b v5 --single-branch --depth=1 clone/mosdns
git clone https://github.com/sbwml/packages_lang_golang -b 24.x --single-branch --depth=1 clone/golang
git clone https://github.com/sbwml/v2ray-geodata --depth=1 clone/v2ray-geodata
git clone https://github.com/Openwrt-Passwall/openwrt-passwall --depth=1 clone/passwall
git clone https://github.com/stevenjoezhang/luci-app-adguardhome --depth=1 clone/luci-app-adguardhome

# rm old packages
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-argon-config
rm -rf feeds/luci/applications/luci-app-passwall 
rm -rf feeds/packages/lang/golang 
rm -rf feeds/packages/net/mosdns 
rm -rf feeds/packages/net/v2ray-geodata

# Update packages
cp -rf clone/amlogic/luci-app-amlogic clone/mosdns/luci-app-mosdns clone/passwall/luci-app-passwall feeds/luci/applications/
cp -rf clone/golang feeds/packages/lang/
cp -rf clone/mosdns/mosdns clone/mosdns/v2dat clone/my-pkg/haproxy clone/v2ray-geodata feeds/packages/net/
cp -rf clone/my-pkg/luci-app-mosdns clone/my-pkg/luci-app-passwall feeds/luci/applications/
cp -rf clone/luci-app-adguardhome feeds/luci/applications/
sed -i '/luci-app-attendedsysupgrade/d' feeds/luci/collections/luci/Makefile

# Clean packages
rm -rf clone
