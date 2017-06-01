local orig_next = _G.next
local pairs_use_global_next = false
_G.next = function() pairs_use_global_next=true end

for k in pairs({}) do end
print(pairs_use_global_next and "pairs() use the global next" or "pairs() use the original next (remembered internaly), not _G.next")

-- use the original next (remembered internaly):
-- lua5.1 yes
-- lua5.2 yes
-- lua5.3 yes
-- luajit2.0 yes
-- luajit2.1 yes
