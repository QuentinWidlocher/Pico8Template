---@class Sprite : Box
---@field public sprite integer : the top left sprite index
Sprite = Box:new({
    sprite = 0,

    __type = "Sprite",
}, false)

---@return Vector
function Sprite:getCoord()
    local y = flr(self.sprite / 16)
    local x = ((self.sprite / 16)%1) * 16
    return Vector:new({x = x, y = y})
end

function Sprite:draw() 
    -- if the sprite is only 1*1, we use spr()
    if self.size == Vector:new({x = fromOct(1), y = fromOct(1)}) then
        spr(self.sprite, self.x, self.y)
    else
        local pos = self:getCoord()
        sspr(
            fromOct(pos.x),
            fromOct(pos.y),
            self.size.x,
            self.size.y,
            self.pos.x,
            self.pos.y
        )
    end
end