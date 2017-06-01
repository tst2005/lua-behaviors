#!/bin/sh

_=[[
	for lua in lua5.1 lua5.2 lua5.3 lua5.4 luajit2.0 luajit2.1; do
		if command >/dev/null 2>&1 -v "$lua"; then
			#echo "## $lua"
			"$lua" -e 'require"'"$(basename "$0" .lua)"'"(_G, "'"$lua"'")' || echo "$lua: got error"
		else
			echo "$lua: not found"
		fi
		echo ""
	done
	exit 0
]]

local function testwith(G, luacmd)
	local string = G.string
	local pcall, assert, error = G.pcall, G.assert, G.error
	local load, loadstring, loadfile, setfenv = G.load, G.loadstring, G.loadfile, G.setfenv

	local v2reader = function(text)
		local i = true
		return function()
			if i then
				i=nil
				return text
			end
			return nil
		end
	end
	local yesno = function(cond) return cond and "yes" or "no" end

	local result = function(name, value, ...)
		if type(value)~="string" or value=="skip" then
			if value~="skip" then
				value = yesno(value)
			end
			G.print(luacmd, value, name, ...)
		else
			G.print(luacmd, name..":", value, ...)
		end
	end

	local function test_load_or_loadstring_with(load)
		-- textcode (string)
		local ok, ts = pcall(load, "return 'foo1'", nil)
		result("- textcode (string)", ok and ts and ts()=="foo1")

		-- textcode (reader)
		local f1 = v2reader("return 'foo1.2'")
		local ok, fs = pcall(load, f1, nil)
		result("- textcode (reader)", ok and fs and fs()=="foo1.2")

		-- bytecode (string)
		local f = function() return "foo2" end
		local ok, tb = pcall(load, string.dump(f), nil)
		result("- bytecode (string)", ok and tb and tb()=="foo2")

		-- bytecode (reader)
		local f = function() return "foo2.2" end
		local f2 = v2reader(string.dump(f))
		local ok, fb = pcall(load, f2, nil)
		result("- bytecode (reader)", ok and fb and fb()=="foo2.2")

		-- in _G, textcode (string)
		_G.bar="Bar1"
		assert(bar=="Bar1")
		local ok, ts = pcall(load, "return bar", nil, nil)
		result("-- textcode (string) + omited env (1)", ok and ts and ts()=="Bar1")

		local ok, ts = pcall(load, "return bar", nil, nil, nil)
		result("-- textcode (string) + nil env (2)", ok and ts and pcall(ts) and ts()=="Bar1")

		local ok, ts = pcall(load, "return bar", nil, nil, _G)
		result("-- textcode (string) + _G env (3)", ok and ts and ts()=="Bar1")
		_G.bar=nil
		assert(bar==nil)

		-- textcode (string) + custom env
		local e = {bar="Bar1e"}
		local ok, ets = pcall(load, "return bar", nil, nil, e)
		result("- textcode (string) + custom_env", ok and ets and ets()=="Bar1e")

		-- textcode (reader) + custom env
		local f1 = v2reader("return string")
		local e = {string="Bar2e"}
		local ok, efs = pcall(load, f1, nil, nil, e)
		result("- textcode (reader) + custom env", ok and efs and efs()=="Bar2e")

--		-- bytecode (string) + custom env
--		local e = {string="Bar2"}
--		--assert(_G.bar==nil)
--		local f = function() return string end
--		local ok, etb = pcall(load, string.dump(f), nil)
--		result("- bytecode (string) + custom env", ok and etb and etb()=="Bar2", (ok and etb and etb()==string) and "(return _G.bar instead of env.bar)" or "")

--		-- bytecode (reader) + custom env
--		result("- bytecode (reader) + custom env", "skip", "see 'bytecode (reader) + custom env'")

	end

	result("load",		load and "exists" or "missing")
	if load then
		test_load_or_loadstring_with(load)
	end

	result("loadstring",	loadstring and "exists" or "missing")
	if loadstring then
		test_load_or_loadstring_with(loadstring)
	end

	result("loadfile",	loadfile and "exists" or "missing")
	if loadfile then
		--
	end
	result("setfenv",	setfenv and "exists" or "missing")
	if setfenv then
		--
	end
end
return testwith
