--[[
 Redsocks2 高级配置页面
 Copyright (C) 2015 GuoGuo <gch981213@gmail.com>
 Modified by wongsyrone
]]--

m = Map("redsocks2", translate("Redsocks2 - Advanced Options"))

s = m:section(TypedSection, "redsocks2_autoproxy", translate("Auto Proxy Options"))
s.anonymous = true

o = s:option(Value, "no_quick_check_seconds", translate("Direct Connect Timeout"))
o.datatype = "and(uinteger)"

o = s:option(Value, "quick_connect_timeout", translate("Quick Check Timeout"))
o.datatype = "and(uinteger)"

s = m:section(TypedSection, "redsocks2_ipcache", translate("IP Cache Options"))
s.anonymous = true

o = s:option(Value, "cache_size", translate("Max Cached Records(K)"))
o.datatype = "and(uinteger)"

o = s:option(Value, "cache_file", translate("Cache File Path"))

o = s:option(Value, "stale_time", translate("Stale Time"), translate("Seconds to stale an IP in cache since it is added into cache. Set it to 0 to disable cache stale."))
o.datatype = "and(uinteger)"

o = s:option(Value, "autosave_interval", translate("Autosave Interval"), translate("Interval for saving ip cache into file. Set it to 0 to disable autosave. <br /> When autosave_interval and stale_time are both 0, IP cache behaves like a static blacklist."))
o.datatype = "and(uinteger)"

o = s:option(Flag, "port_check", translate("Enable Port-based IP Cache"))
o.rmempty = false

return m
