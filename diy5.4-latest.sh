#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
# sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
# 删除openwrt-latest自带的插件
# rm -rf ./package/ctcgew
# rm -rf ./package/lean
# rm -rf ./package/lienol
# rm -rf ./package/ntlf9t
# rm -rf ./package/zxlhhyccc
# 替换文件应用新IP为192.168.50.1及默认中文及设置登录密码为admin
rm -f ./package/base-files/files/bin/config_generate
wget -P ./package/base-files/files/bin/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/package/base-files/files/bin/config_generate
chmod 755 ./package/base-files/files/bin/config_generate
rm -f ./package/base-files/files/etc/shadow
wget -P ./package/base-files/files/etc/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/package/base-files/files/etc/shadow
# 开启wifi
rm -f ./package/kernel/mac80211/files/lib/wifi/mac80211.sh
wget -P ./package/kernel/mac80211/files/lib/wifi/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/package/kernel/mac80211/files/lib/wifi/mac80211.sh
# 去除feeds中的material主题多余固件名
rm -f ./feeds/luci/themes/luci-theme-material/luasrc/view/themes/material/header.htm
wget -P ./feeds/luci/themes/luci-theme-material/luasrc/view/themes/material/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/feeds/luci/themes/luci-theme-material/luasrc/view/themes/material/header.htm
# 将tty所在服务目录改到系统目录
rm -f ./feeds/luci/applications/luci-app-ttyd/root/usr/share/luci/menu.d/luci-app-ttyd.json
wget -P ./feeds/luci/applications/luci-app-ttyd/root/usr/share/luci/menu.d/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/master/feeds/luci/applications/luci-app-ttyd/root/usr/share/luci/menu.d/luci-app-ttyd.json
# 升级feeds中的exfat-nofuse源码
 rm -rf ./feeds/packages/kernel/exfat-nofuse
 svn co  https://github.com/zxlhhyccc/acc-imq-bbr/trunk/master/feeds/packages/kernel/exfat-nofuse feeds/packages/kernel/exfat-nofuse
# 删除feeds里的与自有包冲突插件
rm -rf ./feeds/packages/net/frp
rm -rf ./feeds/packages/net/kcptun
rm -rf ./feeds/packages/net/smartdns
rm -rf ./feeds/packages/utils/syncthing
rm -rf ./feeds/luci/applications/luci-app-frpc
rm -rf ./feeds/luci/applications/luci-app-frps
rm -rf ./packages/lean/openwrt-kcptun
rm -rf ./packages/zxlhhyccc/luci-app-syncthing
rm -rf ./packages/zxlhhyccc/openwrt-syncthing
rm -rf ./packages/zxlhhyccc/verysync
rm -rf ./packages/ntlf9t/luci-app-smartdns
rm -rf ./packages/ntlf9t/smartdns
rm -rf ./packages/ctcgfw/open-app-filter

svn co  https://github.com/zxlhhyccc/bf-package/trunk/lean/frp package/lean/frp
svn co  https://github.com/zxlhhyccc/bf-package/trunk/lean/kcptun package/lean/kcptun
svn co  https://github.com/zxlhhyccc/bf-package/trunk/lean/proxychains-ng package/lean/proxychains-ng

svn co  https://github.com/zxlhhyccc/bf-package/trunk/zxlhhyccc/luci-app-syncthing package/zxlhhyccc/luci-app-syncthing
svn co  https://github.com/zxlhhyccc/bf-package/trunk/zxlhhyccc/syncthing package/zxlhhyccc/syncthing

svn co  https://github.com/zxlhhyccc/bf-package/trunk/lean/luci-app-frpc package/lean/luci-app-frpc
svn co  https://github.com/zxlhhyccc/bf-package/trunk/ctcgfw/luci-app-frps package/tcgfw/luci-app-frps

svn co  https://github.com/zxlhhyccc/bf-package/trunk/ctcgfw/luci-app-k3screenctrl-master package/tcgfw/luci-app-k3screenctrl-master
svn co  https://github.com/zxlhhyccc/bf-package/trunk/zxlhhyccc/Szt-k3sreenctrl-master package/zxlhhyccc/Szt-k3sreenctrl-master
svn co  https://github.com/zxlhhyccc/bf-package/trunk/zxlhhyccc/luci-app-k3usb-master package/zxlhhyccc/luci-app-k3usb-master

svn co  https://github.com/zxlhhyccc/bf-package/trunk/zxlhhyccc/verysync package/zxlhhyccc/verysync

svn co  https://github.com/zxlhhyccc/bf-package/trunk/zxlhhyccc/openclash package/zxlhhyccc/openclash
svn co  https://github.com/zxlhhyccc/bf-package/trunk/zxlhhyccc/AdGuardHome-53xx package/zxlhhyccc/AdGuardHome-53xx
svn co  https://github.com/zxlhhyccc/bf-package/trunk/zxlhhyccc/AdGuardHome-x64 package/zxlhhyccc/AdGuardHome-x64

svn co  https://github.com/zxlhhyccc/bf-package/trunk/lean/luci-app-dnspod package/lean/luci-app-dnspod

svn co  https://github.com/pymumu/luci/trunk/applications/luci-app-smartdns feeds/luci/applications/luci-app-smartdns
svn co  https://github.com/zxlhhyccc/bf-package/trunk/ntlf9t/smartdns package/ntlf9t/smartdns

svn co  https://github.com/zxlhhyccc/bf-package/trunk/zxlhhyccc/OpenAppFilter/open-app-filter package/ctcgfw/open-app-filter

svn co  https://github.com/zxlhhyccc/bf-package/trunk/ctcgfw/bbr-mod package/ctcgfw/bbr-mod
svn co  https://github.com/zxlhhyccc/bf-package/trunk/ctcgfw/bbr-bbrplus package/ctcgfw/bbr-bbrplus
svn co  https://github.com/zxlhhyccc/bf-package/trunk/ctcgfw/bbr-nanqinlang package/ctcgfw/bbr-nanqinlang
svn co  https://github.com/zxlhhyccc/bf-package/trunk/ctcgfw/bbr-tsunami package/ctcgfw/bbr-tsunami
svn co  https://github.com/zxlhhyccc/bf-package/trunk/ctcgfw/bbr-mod-4.19 package/ctcgfw/bbr-mod-4.19
svn co  https://github.com/zxlhhyccc/bf-package/trunk/ctcgfw/bbr-nanqinlang-4.19 package/ctcgfw/bbr-nanqinlang-4.19
svn co  https://github.com/zxlhhyccc/bf-package/trunk/ctcgfw/bbr-tsunami-4.19 package/ctcgfw/bbr-tsunami-4.19


