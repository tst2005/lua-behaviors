
## load in _G

|		| textcode (string)	| bytecode (string)	| textcode (reader)	| bytecode (reader)	|
|---------------|-----------------------|-----------------------|-----------------------|-----------------------|
| lua 5.1	| no			| no			| yes			| yes			|
| lua 5.2	| yes			| yes			| yes			| yes			|
| lua 5.3	| yes			| yes			| yes			| yes			|
| luajit-2.0	| yes			| yes			| yes			| yes			|
| luajit-2.1	| yes			| yes			| yes			| yes			|

## load in custom env

|		| textcode (string)	| bytecode (string)	| textcode (reader)	| bytecode (reader)	|
|---------------|-----------------------|-----------------------|-----------------------|-----------------------|
| lua 5.1	| no			| no			| no			| fail			|
| lua 5.2	| yes			| fail			| yes			| fail			|
| lua 5.3	| yes			| fail			| yes			| fail			|
| luajit-2.0	| yes			| fail			| yes			| fail			|
| luajit-2.1	| yes			| fail			| yes			| fail			|

## load (misc)

|		| debug_info	|
|---------------|---------------|
| lua 5.1	| yes,chunkname	|
| lua 5.2	| yes		|
| lua 5.3	| yes		|
| luajit-2.0	| yes		|
| luajit-2.1	| yes		|

# loadstring in _G

|		| textcode (string)	| bytecode (string)	| textcode (reader)	| bytecode (reader)	|
|---------------|-----------------------|-----------------------|-----------------------|-----------------------|
| lua 5.1	| yes			| yes			| no			| no			|
| lua 5.2	| yes			| yes			| yes			| yes			|
| lua 5.3	| yes			| yes			| yes			| yes			|
| luajit-2.0	| yes			| yes			| yes			| yes			|
| luajit-2.1	| yes			| yes			| yes			| yes			|

## loadstring in custom env

|		| textcode (string)	| bytecode (string)	| textcode (reader)	| bytecode (reader)	|
|---------------|-----------------------|-----------------------|-----------------------|-----------------------|
| lua 5.1	| yes			| no/fail		| yes			| no			|
| lua 5.2	| yes			| fail			| yes			| fail			|
| lua 5.3	| yes			| fail			| yes			| fail			|
| luajit-2.0	| yes			| fail			| yes			| fail			|
| luajit-2.1	| yes			| fail			| yes			| fail			|

## loadstring (misc)

|		| debug_info	|
|---------------|---------------|
| lua 5.1	| yes,chunkname	|
| lua 5.2	| yes		|
| lua 5.3	| yes		|
| luajit-2.0	| yes		|
| luajit-2.1	| yes		|



# current test results

```

lua5.1	load:	exists
lua5.1	no	- textcode (string)
lua5.1	yes	- textcode (reader)
lua5.1	no	- bytecode (string)
lua5.1	yes	- bytecode (reader)
lua5.1	no	-- textcode (string) + omited env (1)
lua5.1	no	-- textcode (string) + nil env (2)
lua5.1	no	-- textcode (string) + _G env (3)
lua5.1	no	- textcode (string) + custom_env
lua5.1	no	- textcode (reader) + custom env
lua5.1	loadstring:	exists
lua5.1	yes	- textcode (string)
lua5.1	no	- textcode (reader)
lua5.1	yes	- bytecode (string)
lua5.1	no	- bytecode (reader)
lua5.1	yes	-- textcode (string) + omited env (1)
lua5.1	yes	-- textcode (string) + nil env (2)
lua5.1	yes	-- textcode (string) + _G env (3)
lua5.1	no	- textcode (string) + custom_env
lua5.1	no	- textcode (reader) + custom env
lua5.1	loadfile:	exists
lua5.1	setfenv:	exists

lua5.2	load:	exists
lua5.2	yes	- textcode (string)
lua5.2	yes	- textcode (reader)
lua5.2	yes	- bytecode (string)
lua5.2	yes	- bytecode (reader)
lua5.2	yes	-- textcode (string) + omited env (1)
lua5.2	no	-- textcode (string) + nil env (2)
lua5.2	yes	-- textcode (string) + _G env (3)
lua5.2	yes	- textcode (string) + custom_env
lua5.2	yes	- textcode (reader) + custom env
lua5.2	loadstring:	exists
lua5.2	yes	- textcode (string)
lua5.2	yes	- textcode (reader)
lua5.2	yes	- bytecode (string)
lua5.2	yes	- bytecode (reader)
lua5.2	yes	-- textcode (string) + omited env (1)
lua5.2	no	-- textcode (string) + nil env (2)
lua5.2	yes	-- textcode (string) + _G env (3)
lua5.2	yes	- textcode (string) + custom_env
lua5.2	yes	- textcode (reader) + custom env
lua5.2	loadfile:	exists
lua5.2	setfenv:	missing

lua5.3	load:	exists
lua5.3	yes	- textcode (string)
lua5.3	yes	- textcode (reader)
lua5.3	yes	- bytecode (string)
lua5.3	yes	- bytecode (reader)
lua5.3	yes	-- textcode (string) + omited env (1)
lua5.3	no	-- textcode (string) + nil env (2)
lua5.3	yes	-- textcode (string) + _G env (3)
lua5.3	yes	- textcode (string) + custom_env
lua5.3	yes	- textcode (reader) + custom env
lua5.3	loadstring:	missing
lua5.3	loadfile:	exists
lua5.3	setfenv:	missing

lua5.4: not found

luajit2.0	load:	exists
luajit2.0	yes	- textcode (string)
luajit2.0	yes	- textcode (reader)
luajit2.0	yes	- bytecode (string)
luajit2.0	yes	- bytecode (reader)
luajit2.0	yes	-- textcode (string) + omited env (1)
luajit2.0	yes	-- textcode (string) + nil env (2)
luajit2.0	yes	-- textcode (string) + _G env (3)
luajit2.0	yes	- textcode (string) + custom_env
luajit2.0	yes	- textcode (reader) + custom env
luajit2.0	loadstring:	exists
luajit2.0	yes	- textcode (string)
luajit2.0	yes	- textcode (reader)
luajit2.0	yes	- bytecode (string)
luajit2.0	yes	- bytecode (reader)
luajit2.0	yes	-- textcode (string) + omited env (1)
luajit2.0	yes	-- textcode (string) + nil env (2)
luajit2.0	yes	-- textcode (string) + _G env (3)
luajit2.0	yes	- textcode (string) + custom_env
luajit2.0	yes	- textcode (reader) + custom env
luajit2.0	loadfile:	exists
luajit2.0	setfenv:	exists

luajit2.1	load:	exists
luajit2.1	yes	- textcode (string)
luajit2.1	yes	- textcode (reader)
luajit2.1	yes	- bytecode (string)
luajit2.1	yes	- bytecode (reader)
luajit2.1	yes	-- textcode (string) + omited env (1)
luajit2.1	yes	-- textcode (string) + nil env (2)
luajit2.1	yes	-- textcode (string) + _G env (3)
luajit2.1	yes	- textcode (string) + custom_env
luajit2.1	yes	- textcode (reader) + custom env
luajit2.1	loadstring:	exists
luajit2.1	yes	- textcode (string)
luajit2.1	yes	- textcode (reader)
luajit2.1	yes	- bytecode (string)
luajit2.1	yes	- bytecode (reader)
luajit2.1	yes	-- textcode (string) + omited env (1)
luajit2.1	yes	-- textcode (string) + nil env (2)
luajit2.1	yes	-- textcode (string) + _G env (3)
luajit2.1	yes	- textcode (string) + custom_env
luajit2.1	yes	- textcode (reader) + custom env
luajit2.1	loadfile:	exists
luajit2.1	setfenv:	exists
```
