-- Helper functions

-- Calculate center position in X axis
-- This is asuming the text uses the system font which is 4px wide
---@param text string
---@return number
function text_x_pos(text)
    local letter_width = 4

    -- first calculate how wide is the text
    local width = #text * letter_width
    
    -- if it's wider than the screen then it's multiple lines so we return 0 
    if width > SCREEN_SIZE then 
        return 0 
    end 

   return SCREEN_SIZE / 2 - flr(width / 2)
end

-- Prints black bordered text
-- color1 is bg, color2 foreground
---@param text string
---@param x number
---@param y number
---@param color1 Color
---@param color2 Color
function write(text,x,y,color1, color2) 
    for i=0,2 do
        for j=0,2 do
            print(text,x+i,y+j, color1)
        end
    end
    print(text,x+1,y+1,color2)
end

---@param time integer
---@param maxtime number
---@return number
function timer(time, maxtime)
    time = time + 1
    if time > maxtime then time = 0 end
    return time
end

---@param text string
---@param x number
---@param y number
function cooltext(text,x,y)
    print(text,x,y+1,6)
    print(text,x,y,5)
end

---@param text string
---@param x number
---@param y number
function supercooltext(text,x,y)
    write(text,x,y,0,0)
    write(text,x,y+1,0,0)
    print(text,x+1,y+1+1,9)
    print(text,x+1,y+1,10)
end

--- log to console AND file
---@param text string
function log(text)
    printh(text)
    printh(text, "log.txt")
end

---@param x number
---@return number
function fromOct(x)
    return x * 8
end

---@param x number
---@param floor boolean
---@return number|integer
function toOct(x, floor)
    floor = floor or false
    return floor and flr(x / 8) or x / 8
end

---@param x number
---@return boolean
function isInsideScreen(x)
    return x > 0 and x < SCREEN_SIZE
end

---@param t table
---@return table
function shallowCopy(t)
    local u = { }
    for k, v in pairs(t) do u[k] = v end
    return setmetatable(u, getmetatable(t))
end

---@param a table
---@param cmp function
---@return table
function sort(a,cmp)
  for i=1,#a do
    local j = i
    while j > 1 and cmp(a[j-1],a[j]) do
        a[j],a[j-1] = a[j-1],a[j]
    j = j - 1
    end
  end
end

function starts(string,start)
   return sub(string,1,#start) == start
end

function str(o, otab)
    local string = ""

    local tab = otab ~= nil and otab or 0
    local tabs = function ()
        local t = ""
        for i = 1, tab, 1 do
            t = t.."\t"
        end
        return t
    end

    if type(o) == 'table' then
        string = string..tabs().."{\n"
        tab = tab + 1
        for key, value in pairs(o) do
            if not starts(key, "__") and type(value) ~= "function" then
                string = string..tabs()..key.." = "..str(value, tab)..",\n"
            end
        end
        tab = tab - 1
        string = string..tabs().."}"
    elseif type(o) ~= "function" then
        string = string..tostr(o)
    end

    return string
end

---"Glitches" the screen by copying part of a line into another
--@param l1 integer line to copy from (optional)
--@param l2 integer line to copy to (optional)
--@param amt integer amount of l1 to copy
function glitch(l1,l2,amt)
 local amt = amt or flr(rnd(64))
 local l1 = 0x6000 + 64 * (l1 or flr(rnd(127)))
 local l2 = 0x6000 + 64 * (l2 or flr(rnd(127))) + flr(rnd(64-amt))
    
 memcpy(l2, l1, amt)
end

---Violently shakes the screen
--MUST be called at the very start of _draw() to function
--Triggered by assigning a positive value to shake - could maybe implement a function instead?
shake = 0
function screen_shake()
 local fade = 0.5
 local amt = 32
 local offset_x=amt/2-rnd(amt)
 local offset_y=amt/2-rnd(amt)
 offset_x = offset_x * shake
 offset_y = offset_y * shake
  
 camera(offset_x,offset_y)
 shake = shake * fade
 if shake<0.05 then
   shake=0
 end
end

---A function that makes sure a number doesn't go outside certain bounds
--@param val number value to clamp
--@param a number lower bound
--@param b number upper bound
function clamp(val, a, b)
    if val < a then val = a end
    if val > b then val = b end
    return val
end

function inc(x, v) return x + v end
function invert(x) return -x end

-- === Moses === --

M = {}

--- Maps `f (v, k)` on value-key pairs, collects and returns the results. 
-- Uses `pairs` to iterate over elements in `t`.
-- <br/><em>Aliased as `collect`</em>.
-- @name map
-- @param t a table
-- @param f  an iterator function, prototyped as `f (v, k)`
-- @return a table of results
-- @see mapi
function M.map(t, f)
  local _t = {}
  for index,value in pairs(t) do
    local k, kv, v = index, f(value, index)
    _t[v and kv or k] = v or kv
  end
  return _t
end

--- filters and returns values passing an iterator test.
-- <br/><em>Aliased as `filter`</em>.
-- @name filter
-- @param t a table
-- @param f an iterator function, prototyped as `f (v, k)`
-- @return the filtered values
-- @see reject
function M.filter(t, f)
  local _t = {}
  for index,value in pairs(t) do
    if f(value,index) then _t[#_t+1] = value end
  end
  return _t
end