local pairs5x = require "pairs5x"
local ipairs5x = require "ipairs5x"

if _VERSION=="Lua 5.1" then
	pairs = pairs5x.pairs53
	ipairs = ipairs5x.ipairs52
elseif _VERSION=="Lua 5.2" then
	--ipairs = ipairs5x.ipairs52
end

local called={}
local function call(name) called[name]=(called[name] or 0)+1 end
local b = {[1]="I", [2]="II", b="bb", c="cc"}
local a = setmetatable({ex="xx",a="aa",[1]="11"},
	{
		__index=function(_, k) call"__index" return b[k] end,
		--__next=function(_, ...) call"__next" return next(b, ...) end,
		__pairs=function() call"__pairs" return pairs(b) end,
		__ipairs=function(_, ...) call"__ipairs" return ipairs(b, ...) end,
	}
)
print("next:")
for k,v in next, a do
	print(k, v)
end

-- PAIRS
-- lua5.1 / luajit(2.0) => does not use __pairs
-- lua5.2               => use the __pairs

-- IPAIRS
-- lua5.1 / luajit(2.0) => does not use __ipairs
-- lua5.2 => use the __ipairs

print("pairs:")
for k,v in pairs(a) do
	print(k,v)
end

print("ipairs:")
--assert(a[1]=="I")
--assert(a[2]=="II")
for k,v in ipairs(a, 2) do
	print(k,v)
end


print("STATS:")
for k,v in pairs(called) do print(k,v) end
