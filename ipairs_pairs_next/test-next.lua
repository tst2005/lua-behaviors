t = {a=111,  b=222, c=333}
u = {a=123, d=444}
setmetatable(t, {__index=u})
for i,v in next,t do print(i,v) end

