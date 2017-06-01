local pairs = require"pairs5x"[assert(arg[1], "missing argument #1")]

local t = {a="aa", b="bb", c="cc"}
for k,v in pairs(t) do
	print(k,v)
end

print("-----")
local f = pairs(t)
print(f(nil, nil))
print(f(nil, "a"))
print(f(nil, "b"))
print(f(nil, "c"))

print("-----")
local f = pairs(t)
print(f(nil, nil))
print(f(nil, nil))
print(f(nil, nil))
print(f(nil, nil))


