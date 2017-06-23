
m = Map("cpulimit", translate("cpulimit"),translate("Use cpulimit to restrict app's cpu usage."))
s = m:section(TypedSection, "list", translate("Settings"))
s.template = "cbi/tblsection"
s.anonymous = true
s.addremove = true

enable = s:option(Flag, "enabled", translate("enable", "enable"))
enable.optional = false
enable.rmempty = false

-- pick 3rd part;delete 1st line;delete lines started with '[' and '{';delete basic command using extend regexp;pick the last part divided by '/';sort the list
-- make sure your sed command has '-r' or '-E' option
local pscmd="ps | awk '{print $3}' | sed '1d' | sed '/^\\[/d' | sed '/^{/d' | sed -E '/(-ash|sh|sed|awk|hostapd|pppd|mwan3|sleep|sort|uniq|ps|insmod|rmmod|odhcp6c)/d' | awk -F'/' '{print $NF}' | sort -u"
local shellpipe = io.popen(pscmd,"r")


exename = s:option(Value, "exename", translate("Executable Name"), translate("Name of the executable program file. Should NOT Be a Path!"))
exename.optional = false
exename.rmempty = false
exename.default = "dnsmasq"
for psvalue in shellpipe:lines() do
	exename:value(psvalue)
end

limit = s:option(Value, "limit", translate("Usage restrictions"))
limit.optional = false
limit.rmempty = false
limit.default = "50"
limit:value("100","100%")
limit:value("90","90%")
limit:value("80","80%")
limit:value("70","70%")
limit:value("60","60%")
limit:value("50","50%")
limit:value("40","40%")
limit:value("30","30%")
limit:value("20","20%")
limit:value("10","10%")


return m
