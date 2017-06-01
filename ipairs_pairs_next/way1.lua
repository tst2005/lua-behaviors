local function pairs53simple(t) -- lua5.2 and lua5.3 use mt.__pairs
        local mt = getmetatable(t)
        if mt and mt.__pairs then
                return mt.__pairs(t)
        end
        return next, t, nil
end

