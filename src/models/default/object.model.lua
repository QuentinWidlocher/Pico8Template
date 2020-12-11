-- Object Class

---@class Object
Object = {
	__type = 'Object'
}

---@param o Object
---@return Object
function Object:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

---@return string
function Object:toString()
	return self.__type .." = "..str(self)
end