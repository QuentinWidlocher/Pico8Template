-- GameObject Class

---@class GameObject : Object
GameObject = Object:new({
    __type = "GameObject"
})

---@type GameObject[]
GameObject.pool = {}

---@param o GameObject
---@return GameObject
function GameObject:new(o, addToPool)
    self = Object.new(self, o)
    if addToPool == nil or addToPool == true then
        add(GameObject.pool, self)
    end
    return self
end

function GameObject:init() end
function GameObject:update() end
function GameObject:draw() end