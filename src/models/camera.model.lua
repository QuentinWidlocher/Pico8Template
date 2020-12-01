-- Camera Class

Camera = Entity:new()

function Camera:new(o,c)
    o = o or Entity:new()
	setmetatable(o, self)
    self.__index = self
    self.speed = c and c.speed or 1
    self.margin = c and c.margin or 0
	return o
end

function Camera:touch_top_margin(object)
    return object.y > self.y + (SCREEN_SIZE/2) + self.margin
end

function Camera:touch_bottom_margin(object)
    return object.y < self.y + (SCREEN_SIZE/2) - self.margin
end

function Camera:move(dir)
    self.x += dir.x
	self.y += dir.y
	camera(self.x,self.y)
end

main_camera = Camera:new()