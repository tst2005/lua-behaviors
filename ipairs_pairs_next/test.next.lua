local orig_next = _G.next
local pairs_use_global_next = false
_G.next = function() pairs_use_global_next=true end

for k in pairs({}) do end
print(pairs_use_global_next and "call the global next" or "use the native next, remembered internaly")

