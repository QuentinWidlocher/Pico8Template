-- Helper functions

-- Calculate center position in X axis
-- This is asuming the text uses the system font which is 4px wide
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
function write(text,x,y,color1, color2) 
    for i=0,2 do
        for j=0,2 do
            print(text,x+i,y+j, color1)
        end
    end
    print(text,x+1,y+1,color2)
end

function timer(time, maxtime)
    time += 1
    if time > maxtime then time = 0 end
    return time
end

function cooltext(text,x,y)
    print(text,x,y+1,6)
    print(text,x,y,5)
end

function empty_array(arr)
    for i = 1, #arr do
        arr[i] = ""
    end
end

function supercooltext(text,x,y)
    write(text,x,y,0,0)
    write(text,x,y+1,0,0)
    print(text,x+1,y+1+1,9)
    print(text,x+1,y+1,10)
end