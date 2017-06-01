local good = {"I", "II"}
local callable = setmetatable({"I@c", "II@c"}, {__call=function(_, _t, k) return good[k] end})
local bad= {"x", "xx"}
local test = setmetatable({}, {
	__index=callable, --good,
	__ipairs=setmetatable({}, {__call=function() return ipairs(bad) end,})
})

for i,v in ipairs(test) do print(i,v) end
for i,v in ipairs(callable) do print(i,v) end

