-- Licensed to the public under the Apache License 2.0.

m = Map("travelmate", translate("Travelmate"),
	translate("Configuration of the Travelmate package to enable travel router functionality. ") .. [[</p>]] ..
	translate("Brief advice: Create a wwan interface, configure it to use dhcp and " ..
		"add it to the wan zone in firewall. Create the wifi interfaces to be used ('client' mode, " ..
		"assigned to wwan network, left as disabled). Travelmate will try " ..
		"to connect to the known wifi client interfaces in the defined order. ") ..
	[[<a href="https://github.com/openwrt/packages/tree/master/net/travelmate/files/README.md" target="_blank">]] 
	.. translate("Link to detailed advice")
	.. [[</a>]] )

-- General options

s = m:section(NamedSection, "global", "travelmate", translate("Global options"))

o = s:option(Flag, "trm_enabled", translate("Enable Travelmate"))
o.rmempty = false
o.default = 0

o = s:option(Value, "trm_loop", translate("Loop timeout in seconds for wlan monitoring"),
	translate("Default 30, range 5-60"))
o.rmempty = false
o.default = 30
o.datatype = "range(5,60)"

o = s:option(Value, "trm_maxretry", translate("Max. number of connection retries to an uplink"),
	translate("Default 3, range 0-10. Set to 0 to allow unlimited retries"))
o.rmempty = false
o.default = 3
o.datatype = "range(0,10)"

-- Extra options

e = m:section(NamedSection, "global", "travelmate", translate("Extra options"))

a = e:option(Flag, "trm_debug", translate("Debug logging"))
a.rmempty = true
a.default = a.disabled

a = e:option(Value, "trm_device", translate("Use only one radio, e.g. 'radio0'"),
	translate("Default: empty = use all radios."))
a.rmempty = true
a.default = ""
a.datatype = "uciname"

a = e:option(Flag, "trm_iw", translate("Use iw for scanning"),
	translate("Disable this if you want to use iwinfo instead of iw"))
a.rmempty = true
a.default = a.enabled

return m

