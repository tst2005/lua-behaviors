
## load

|		| textcode (string)	| bytecode (string)	| textcode (function)	| bytecode (function)	| in _G | in custom env	| debug_info	|
|---------------|-----------------------|-----------------------|-----------------------|-----------------------|-------|---------------|---------------|
| lua 5.1	| no			| no			| yes			| yes			| yes	| 		| yes,chunkname	|
| lua 5.2	| yes			| yes			| yes			| yes			| yes	| yes		| yes		|
| lua 5.3	| yes			| yes			| yes			| yes			| yes	| yes		| yes		|
| luajit-2.0	| yes			| yes			| yes			| yes			| yes	| ?????		| yes		|
| luajit-2.1	| yes			| yes			| yes			| yes			| yes	| yes		| yes		|

## loadstring

| 		| textcode (string)	| bytecode (string)	| textcode (function)	| bytecode (function)	| in _G | in custom env	| debug_info	|
|---------------|-----------------------|-----------------------|-----------------------|-----------------------|-------|---------------|---------------|
| lua 5.1	| yes			| yes			| no			| no			| yes	| no		| yes,chunkname	|
| luajit-2.0	| yes			| yes			| yes			| yes			| yes	| ?????		| yes		|
| luajit-2.1b2	| yes			| yes			| yes			| yes			| yes	| yes		| yes		|
|																			|
| lua 5.2	| function removed															|
| lua 5.3	| function removed															|


# current test results

```
lua5.1	load:	exists
lua5.1	no	- textcode (string)
lua5.1	no	- textcode (string) + custom_env
lua5.1	yes	- textcode (function)
lua5.1	no	- textcode (function) + custom env
lua5.1	no	- bytecode (string)
lua5.1	yes	- bytecode (function)
lua5.1	no	-- textcode (string) + omited env (1)
lua5.1	no	-- textcode (string) + nil env (2)
lua5.1	no	-- textcode (string) + _G env (3)
lua5.1	loadstring:	exists
lua5.1	yes	- textcode (string)
lua5.1	no	- textcode (string) + custom_env
lua5.1	no	- textcode (function)
lua5.1	no	- textcode (function) + custom env
lua5.1	yes	- bytecode (string)
lua5.1	no	- bytecode (function)
lua5.1	yes	-- textcode (string) + omited env (1)
lua5.1	yes	-- textcode (string) + nil env (2)
lua5.1	yes	-- textcode (string) + _G env (3)
lua5.1	loadfile:	exists
lua5.1	setfenv:	exists

lua5.2	load:	exists
lua5.2	yes	- textcode (string)
lua5.2	yes	- textcode (string) + custom_env
lua5.2	yes	- textcode (function)
lua5.2	yes	- textcode (function) + custom env
lua5.2	yes	- bytecode (string)
lua5.2	yes	- bytecode (function)
lua5.2	yes	-- textcode (string) + omited env (1)
lua5.2	no	-- textcode (string) + nil env (2)
lua5.2	yes	-- textcode (string) + _G env (3)
lua5.2	loadstring:	exists
lua5.2	yes	- textcode (string)
lua5.2	yes	- textcode (string) + custom_env
lua5.2	yes	- textcode (function)
lua5.2	yes	- textcode (function) + custom env
lua5.2	yes	- bytecode (string)
lua5.2	yes	- bytecode (function)
lua5.2	yes	-- textcode (string) + omited env (1)
lua5.2	no	-- textcode (string) + nil env (2)
lua5.2	yes	-- textcode (string) + _G env (3)
lua5.2	loadfile:	exists
lua5.2	setfenv:	missing

lua5.3	load:	exists
lua5.3	yes	- textcode (string)
lua5.3	yes	- textcode (string) + custom_env
lua5.3	yes	- textcode (function)
lua5.3	yes	- textcode (function) + custom env
lua5.3	yes	- bytecode (string)
lua5.3	yes	- bytecode (function)
lua5.3	yes	-- textcode (string) + omited env (1)
lua5.3	no	-- textcode (string) + nil env (2)
lua5.3	yes	-- textcode (string) + _G env (3)
lua5.3	loadstring:	missing
lua5.3	loadfile:	exists
lua5.3	setfenv:	missing

lua5.4: not found

luajit2.0	load:	exists
luajit2.0	yes	- textcode (string)
luajit2.0	yes	- textcode (string) + custom_env
luajit2.0	yes	- textcode (function)
luajit2.0	yes	- textcode (function) + custom env
luajit2.0	yes	- bytecode (string)
luajit2.0	yes	- bytecode (function)
luajit2.0	yes	-- textcode (string) + omited env (1)
luajit2.0	yes	-- textcode (string) + nil env (2)
luajit2.0	yes	-- textcode (string) + _G env (3)
luajit2.0	loadstring:	exists
luajit2.0	yes	- textcode (string)
luajit2.0	yes	- textcode (string) + custom_env
luajit2.0	yes	- textcode (function)
luajit2.0	yes	- textcode (function) + custom env
luajit2.0	yes	- bytecode (string)
luajit2.0	yes	- bytecode (function)
luajit2.0	yes	-- textcode (string) + omited env (1)
luajit2.0	yes	-- textcode (string) + nil env (2)
luajit2.0	yes	-- textcode (string) + _G env (3)
luajit2.0	loadfile:	exists
luajit2.0	setfenv:	exists

luajit2.1	load:	exists
luajit2.1	yes	- textcode (string)
luajit2.1	yes	- textcode (string) + custom_env
luajit2.1	yes	- textcode (function)
luajit2.1	yes	- textcode (function) + custom env
luajit2.1	yes	- bytecode (string)
luajit2.1	yes	- bytecode (function)
luajit2.1	yes	-- textcode (string) + omited env (1)
luajit2.1	yes	-- textcode (string) + nil env (2)
luajit2.1	yes	-- textcode (string) + _G env (3)
luajit2.1	loadstring:	exists
luajit2.1	yes	- textcode (string)
luajit2.1	yes	- textcode (string) + custom_env
luajit2.1	yes	- textcode (function)
luajit2.1	yes	- textcode (function) + custom env
luajit2.1	yes	- bytecode (string)
luajit2.1	yes	- bytecode (function)
luajit2.1	yes	-- textcode (string) + omited env (1)
luajit2.1	yes	-- textcode (string) + nil env (2)
luajit2.1	yes	-- textcode (string) + _G env (3)
luajit2.1	loadfile:	exists
luajit2.1	setfenv:	exists
```
