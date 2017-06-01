

# about `next` and `pairs`

The `next` and `pairs` functions are available by default in the global environment.

# how to get `next` with `pairs`

Tested on lua5.1/5.2/5.3/luajit2.0.
All tested implementation allow to get (via `pairs`) a function that are equal to `next`.
The `pairs` seems access to the original `next` function internaly.

Sample:
```  
print(next)         
next=nil
local next2 = pairs({a="a"})
print(next2) 
```

```
print(next)
next_txt=tostring(next)
next=nil           
t={a="aa",b="bb",c="cc"}
local next2 = pairs(t)
local next3 = pairs(t)
print(next2, next3, next2==next3 and "pairs next with the same table are the same" or "pairs next differ even with the same table")
print(next_txt==tostring(next2) and "original next == pairs next" or "original next != pairs next")

```


Each pairs call

The `pairs` function (in most of case) return some value, the first one is the `next` handler
All lua implementation and version that I have tested have the same pairs behavior about the first next-like.


# TODO

- ipairs51 seems ok
- ipairs52 seems ok
- ipairs53 not perfect, the lua5.3 follow a strong behavior (the next() ? or something else?) lua 5.1-5.2 follow the [1][2][3] lua5.3 [1][2][7]
