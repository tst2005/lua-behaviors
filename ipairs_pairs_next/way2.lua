local function pairs53simple(t) -- lua5.2 and lua5.3 use mt.__pairs
        return (
                ((getmetatable(t) or {}).__pairs)
                or
                (function() return next, t, nil end)
        )(t)
end

