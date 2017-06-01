
## load

| load		| textcode (string)	| bytecode (string)	| textcode (function)	| bytecode (function)	| in _G | in custom env	| debug_info	|
| lua 5.1	| no 1.			| no 1.			| yes			| yes			| yes	| no 2.		| yes,chunkname	|
| lua 5.2	| yes			| yes			| yes			| yes			| yes	| yes		| yes		|
| lua 5.3	| yes			| yes			| yes			| yes			| yes	| yes		| yes		|
| luajit-2.0	| yes			| yes			| yes			| yes			| yes	| ?????		| yes		|
| luajit-2.1	| yes			| yes			| yes			| yes			| yes	| yes		| yes		|

1: easy compat with function
2: possible compat with setfenv

## loadstring

| 		| textcode (string)	| bytecode (string)	| textcode (function)	| bytecode (function)	| in _G | in custom env	| debug_info	|
|---------------|-----------------------|-----------------------|-----------------------|-----------------------|-------|---------------|---------------|
| lua 5.1	| yes			| yes			| no			| no			| yes	| no \*\*	| yes,chunkname	|
| luajit-2.0	| yes			| yes			| yes			| yes			| yes	| ?????		| yes		|
| luajit-2.1b2	| yes			| yes			| yes			| yes			| yes	| yes		| yes		|
|																			|
| lua 5.2	| function removed															|
| lua 5.3	| function removed															|

