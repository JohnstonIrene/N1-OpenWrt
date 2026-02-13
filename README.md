# 项目简介
本固件适配斐讯 N1 旁路由模式，追求轻量（请注意：不具备 PPPoE、WiFi 相关功能）。<br>
固件包含默认皮肤、完整 IPv6 支持，以及下列 luci-app：<br>
[luci-app-amlogic](https://github.com/ophub/luci-app-amlogic)：晶晨宝盒<br>
[luci-app-passwall](https://github.com/Openwrt-Passwall/openwrt-passwall)：科学上网<br>
[luci-app-adguardhome](https://github.com/AdguardTeam/AdGuardHome/releases)：广告拦截<br>
[luci-app-mosdns](https://github.com/sbwml/luci-app-mosdns)：DNS转发器<br>
luci-app-dockerman：Docker管理<br>
luci-app-samba4：NAS网络共享<br>
***
# 致谢
本项目基于 [ImmortalWrt-24.10](https://github.com/immortalwrt/immortalwrt/tree/openwrt-24.10) 源码编译，使用 flippy 的[脚本](https://github.com/unifreq/openwrt_packit)和 ophub 维护的[内核](https://github.com/ophub/kernel/releases/tag/kernel_stable)打包成完整固件，感谢开发者们的无私分享。<br>
flippy 固件的更多细节参考[恩山论坛帖子](https://www.right.com.cn/forum/thread-4076037-1-1.html)。