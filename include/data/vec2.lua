-- 2D vector class

local vec2 = setmetatable({}, {    
    __call = function(t, x, y)
        return t.new(x, y)
    end,
})

local vec2mt = {
    __index = vec2,
    
    __add = function(a, b)
      return vec2.new(a.x + b.x, a.y + b.y)
    end,
    
    __sub = function(a, b)
      return vec2.new(a.x - b.x, a.y - b.y)
    end,
    
    __mul = function(a, b)
        local x, y
        if type(b) == "table" then
            x = b.x
            y = b.y
        else
            x = b
            y = b
        end
      return vec2.new(a.x * x, a.y * y)
    end,
    
    __unm = function(a)
      return vec2.new(-a.x, -a.y)
    end,
    
    __eq = function(a, b)
      return (a.x == b.x and a.y == b.y)
    end,
  }

vec2.new = function(x, y)
  return setmetatable({x = x, y = y}, vec2mt)
end

function vec2:set(x, y)
  self.x = x
  self.y = y
end

function vec2:dot(b)
  return self.x * b.x + self.y * b.y
end

function vec2:normalize()
  local mag = math.sqrt(self.x^2 + self.y^2)
  return vec2.new(self.x/mag, self.y/mag)
end

function vec2:getNormal()
  return vec2.new(self.y, -self.x)
end

return vec2
