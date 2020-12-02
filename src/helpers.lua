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