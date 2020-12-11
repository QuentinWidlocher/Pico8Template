-- Camera Class

---@class Camera : Object
---@field public Vector number
---@field public speed number
---@field public margin number
Camera = Object:new({
    pos = Vector:new(),
    speed = 1,
    margin = 0,

    __type = "Camera",
})

---@param object Box
---@return boolean
function Camera:touch_top_margin(object)
    return object.y > self.y + (SCREEN_SIZE/2) + self.margin
end

---@param object Box
---@return boolean
function Camera:touch_bottom_margin(object)
    return object.y < self.y + (SCREEN_SIZE/2) - self.margin
end

---@param dir Vector
function Camera:move(dir)
    self.x = self.x + dir.x
	self.y = self.y + dir.y
	camera(self.x,self.y)
end