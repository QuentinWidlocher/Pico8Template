---@class Vector
---@field public x number
---@field public y number
Vector = Object:new({
    x = 0,
    y = 0,

    __type = "Vector",
})

---@param forceToEight boolean
---@return Vector
function Vector.random(forceToEight)
    if forceToEight then
        return { x = 1 - flr(rnd(2)), y = 1 - flr(rnd(2)) }
    else
        return { x = 1 - rnd(2), y = 1 - rnd(2) }
    end
end

---@param size number
---@return Vector
function Vector.square(size)
    return Vector:new({
        x = size, 
        y = size
    })
end

---@param v2 Vector
---@return number
function Vector:distanceTo(v2)
    return sqrt(((self.x - v2.x)^2)+((self.y - v2.y)^2))
end

---@return number
function Vector:length()
    return sqrt(self.x * self.x + self.y * self.y)
end

---@return Vector
function Vector:normalized()
    local length = self:length()
    return {
        x = self.x / length,
        y = self.y / length,
    }
end

---@param v2 Vector
---@return Vector
function Vector:subtractBy(v2)
    return {
        x = v2.x - self.x,
        y = v2.y - self.y,
    }
end

---@param rad number
---@return Vector
function Vector:rotate(rad)
    return {
        x = self.x * cos(rad) - self.y * sin(rad),
        y = self.x * sin(rad) + self.y * cos(rad)
    }
end