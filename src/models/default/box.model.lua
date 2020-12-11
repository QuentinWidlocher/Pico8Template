---@class Box: GameObject
---@field public pos Vector
---@field public size Vector
Box = GameObject:new({
    pos = Vector:new(),
    size = Vector:new(),

    __type = "Box",
}, false)

---@param box2 Box
---@return boolean
function Box:collide(box2) 
	return box2.x < self.x + self.w and self.x < box2.x + box2.w 
        and box2.y < self.y + self.h and self.y < box2.y + box2.h
end