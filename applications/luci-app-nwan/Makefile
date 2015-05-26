#
# Copyright (C) 2008-2014 The LuCI Team <luci@lists.subsignal.org>
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

LUCI_TITLE:=NWAN LuCI Interface
LUCI_DESCRIPTION:=An agent script that makes nwan configuration simple, easy and manageable. Complete with load balancing, failover and an easy  to manage traffic ruleset.
LUCI_DEPENDS:=+curl +libc +ip +kmod-macvlan +iptables +iptables-mod-conntrack-extra +iptables-mod-ipopt

include ../../luci.mk

# call BuildPackage - OpenWrt buildroot signature
