local function nexti(t, i)
	local k=i, v
	while true do
		k, v = next(t, k)
		if k==nil or type(k)=="number" then
			return k,v
		end
	end
end

local function ipairsall(t)
	return nexti, t, nil
end

--local t = {"a", "b", a="X", [7]="c", "x", [11]="z"}
local t={} t[1]="a" t[2]="b" t.a="X" t[7]="c" t[3]="x" t[ 11]="z"
print('#t', #t)
for i,v in ipairsall(t) do
	print(i,v)
end
