next_txt=tostring(next)
next=nil           
t={a="aa",b="bb",c="cc"}
local next2 = pairs(t)
local next2b = pairs(t)
local next3 = pairs({1,2,3})
print("pairs return the original next function:", next_txt==tostring(next2) and "yes" or "no", next_txt, next2)
print("same pairs-next with different table:", next2==next3 and "yes" or "no", next2, next3)
print("same pairs-next with the same table:", next2==next2b and "yes" or "no", next2, next2b)

