#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
# luci-compat: 在不足的ACL上启用旧式CBI表单
sed -i 's/disabled/Enable/g' feeds/luci/modules/luci-compat/luasrc/view/cbi/footer.htm
# 替换map.htm适配启用旧式CBI
rm -f ./feeds/luci/modules/luci-compat/luasrc/view/cbi/map.htm
wget -P ./feeds/luci/modules/luci-compat/luasrc/view/cbi/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/feeds/luci/modules/luci-compat/luasrc/view/cbi/map.htm
# 添加默认编译包
rm -f ./include/target.mk
wget -P ./include/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/include/target.mk
rm -f ./include/netfilter.mk
wget -P ./include/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/include/netfilter.mk
# kernel支持及修改连接数
rm -f ./package/kernel/linux/modules/netdevices.mk
wget -P ./package/kernel/linux/modules/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/package/kernel/linux/modules/netdevices.mk
rm -f ./package/kernel/linux/modules/netfilter.mk
wget -P ./package/kernel/linux/modules/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/package/kernel/linux/modules/netfilter.mk
rm -f ./package/kernel/linux/files/sysctl-nf-conntrack.conf
wget -P ./package/kernel/linux/files/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/package/kernel/linux/files/sysctl-nf-conntrack.conf
# 还原master的network中防火墙等源码包
rm -rf ./package/network/config/firewall
svn co https://github.com/project-openwrt/openwrt/branches/master/package/network/config/firewall package/network/config/firewall
rm -rf ./package/network/utils/iptables
svn co https://github.com/project-openwrt/openwrt/branches/master/package/network/utils/iptables package/network/utils/iptables
rm -rf ./package/network/utils/iproute2
svn co https://github.com/project-openwrt/openwrt/branches/master/package/network/utils/iproute2 package/network/utils/iproute2
rm -rf ./package/network/services/uhttpd
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/master/package/network/services/uhttpd package/network/services/uhttpd
# 修改替换feeds里的luci-app-firewall加速开关等源码包
rm -rf ./feeds/luci/applications/luci-app-firewall
svn co https://github.com/project-openwrt/luci/trunk/applications/luci-app-firewall feeds/luci/applications/luci-app-firewall
# 修改mwan3检测IP
rm -f ./feeds/packages/net/mwan3/files/etc/config/mwan3
wget -P ./feeds/packages/net/mwan3/files/etc/config/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/feeds/packages/net/mwan3/files/etc/config/mwan3
# 添加4.19内核补丁
wget -P target/linux/generic/pending-4.19/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/target/linux/generic/pending-4.19/601-add-kernel-imq-support.patch
wget -P target/linux/generic/pending-4.19/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/target/linux/generic/pending-4.19/607-tcp_bbr-adapt-cwnd-based-on-ack-aggregation-estimation.patch
wget -P target/linux/generic/pending-4.19/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/target/linux/generic/pending-4.19/608-add-kernel-gargoyle-netfilter-match-modules.patch
wget -P target/linux/generic/hack-4.19/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/target/linux/generic/hack-4.19/952-net-conntrack-events-support-multiple-registrant.patch
# wget -P target/linux/generic/pending-4.19/ https://raw.githubusercontent.com/project-openwrt/openwrt-latest/master/target/linux/generic/pending-4.19/760-net-usb-aqc111-Driver-skeleton-for-Aquantia-AQtionUSB-to-5GbE.patch
rm -f ./target/linux/generic/config-4.19
wget -P ./target/linux/generic/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/target/linux/generic/config-4.19
wget -P ./target/linux/x86/patches-4.19/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/target/linux/x86/patches-4.19/900-x86-Enable-fast-strings-on-Intel-if-BIOS-hasn-t-already.patch
# 添加bcm53xx默认内核为4.19
# rm -f ./target/linux/bcm53xx/Makefile
# wget -P ./target/linux/bcm53xx/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/target/linux/4.19-5.4-bcm53xx/Makefile
# 添加x86默认编译包及内核为4.19
# rm -f ./target/linux/x86/Makefile
# wget -P ./target/linux/x86/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/target/linux/4.19-5.4-x86/Makefile
# 添加upx压缩
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/master/tools/ucl tools/ucl
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/master/tools/upx tools/upx
rm -f ./tools/Makefile
wget -P ./tools/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/tools/Makefile
# 去除feeds中的material主题多余固件名
rm -f ./feeds/luci/themes/luci-theme-material/luasrc/view/themes/material/header.htm
wget -P ./feeds/luci/themes/luci-theme-material/luasrc/view/themes/material/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/feeds/luci/themes/luci-theme-material/luasrc/view/themes/material/header.htm
# 将tty所在服务目录改到系统目录
rm -f ./feeds/luci/applications/luci-app-ttyd/root/usr/share/luci/menu.d/luci-app-ttyd.json
wget -P ./feeds/luci/applications/luci-app-ttyd/root/usr/share/luci/menu.d/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/feeds/luci/applications/luci-app-ttyd/root/usr/share/luci/menu.d/luci-app-ttyd.json
# 添加feeds里的依赖包
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/master/feeds/packages/lang/python/Flask-RESTful feeds/packages/lang/python/Flask-RESTful
svn co https://github.com/project-openwrt/packages/trunk/libs/opencv feeds/packages/libs/opencv
svn co https://github.com/project-openwrt/packages/trunk/libs/fcgi feeds/packages/libs/fcgi
# 升级feeds中的exfat-nofuse源码
rm -rf ./feeds/packages/kernel/exfat-nofuse
svn co  https://github.com/zxlhhyccc/acc-imq-bbr/trunk/master/feeds/packages/kernel/exfat-nofuse feeds/packages/kernel/exfat-nofuse
# 修复transmission
rm -rf ./feeds/packages/net/transmission
svn co  https://github.com/project-openwrt/packages/trunk/net/transmission feeds/packages/net/transmission
rm -rf ./feeds/packages/net/transmission-web-control
svn co  https://github.com/project-openwrt/packages/trunk/net/transmission-web-control feeds/packages/net/transmission-web-control
rm -rf ./feeds/luci/applications/luci-app-transmission
svn co  https://github.com/project-openwrt/luci/trunk/applications/luci-app-transmission feeds/luci/applications/luci-app-transmission
# 修改sqm-scripts汉化help
rm -rf ./feeds/packages/net/sqm-scripts
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/master/feeds/packages/net/sqm-scripts feeds/packages/net/sqm-scripts
# 删除sqm仍未进行汉化的po文件
# rm -rf ./feeds/luci/applications/luci-app-sqm/po/zh_Hans
# svn co https://github.com/openwrt/luci/trunk/applications/luci-app-sqm/po/zh_Hans feeds/luci/applications/luci-app-sqm/po/zh_Hans
# 修复新版luci的cpu等寄存器显示
rm -f feeds/luci/modules/luci-mod-network/root/usr/share/rpcd/acl.d/luci-mod-network.json
wget -P ./feeds/luci/modules/luci-mod-network/root/usr/share/rpcd/acl.d/ https://raw.githubusercontent.com/project-openwrt/luci/master/modules/luci-mod-network/root/usr/share/rpcd/acl.d/luci-mod-network.json
rm -f ./feeds/luci/modules/luci-mod-status/root/usr/share/rpcd/acl.d/luci-mod-status.json
wget -P ./feeds/luci/modules/luci-mod-status/root/usr/share/rpcd/acl.d/ https://raw.githubusercontent.com/project-openwrt/luci/master/modules/luci-mod-status/root/usr/share/rpcd/acl.d/luci-mod-status.json
rm -f ./feeds/luci/modules/luci-mod-system/root/usr/share/rpcd/acl.d/luci-mod-system.json
wget -P ./feeds/luci/modules/luci-mod-system/root/usr/share/rpcd/acl.d/ https://raw.githubusercontent.com/project-openwrt/luci/master/modules/luci-mod-system/root/usr/share/rpcd/acl.d/luci-mod-system.json
# 删除feeds里的与自有包冲突插件
rm -rf ./feeds/packages/net/frp
rm -rf ./feeds/packages/net/kcptun
rm -rf ./feeds/packages/net/smartdns
rm -rf ./feeds/packages/utils/syncthing
rm -rf ./feeds/luci/applications/luci-app-frpc
rm -rf ./feeds/luci/applications/luci-app-frps
rm -rf ./package/openwrt-package/lean/luci-app-ksmbd
rm -rf ./package/openwrt-package/lean/luci-app-nft-qos
rm -rf ./package/openwrt-package/lean/nft-qos
# 替换acc
# rm -rf ./package/openwrt-package/lean/luci-app-flowoffload-master
# pushd package/openwrt-package/lean
# unzip luci-app-flowoffload-master-NAT.zip
# popd
