ThrowableObject = Class{__includes = GameObject}

function ThrowableObject:init(def, x , y)
    GameObject.init(self, def, x, y)
    self.liftable = true
    self.thrown = false
    self.direction = 'left'
    self.speed = 80
end

function ThrowableObject:update(dt)
    if self.thrown then
        if self.direction == 'left' then
            self.x = self.x - self.speed * dt
        elseif self.direction == 'right' then
            self.x = self.x + self.speed * dt
        elseif self.derection == 'up' then
            self.y = self.y - self.speed * dt
        elseif self.direction == 'down' then
            self.y = self.y + self.speed * dt
        end
    end
end
