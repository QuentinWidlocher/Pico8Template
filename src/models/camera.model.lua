-- Camera Class

---@class Camera : Entity
---@field public speed number
---@field public margin number
Camera = {
    speed = 1,
    margin = 0,
}

---@param o Camera
---@return Camera
function Camera:new(o)
    o = o or Entity:new()
	setmetatable(o, self)
    self.__index = self
    self.speed = o and o.speed or 1
    self.margin = o and o.margin or 0
	return o
end

---@param object Entity
---@return boolean
function Camera:touch_top_margin(object)
    return object.y > self.y + (SCREEN_SIZE/2) + self.margin
end

---@param object Entity
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

main_camera = Camera:new()