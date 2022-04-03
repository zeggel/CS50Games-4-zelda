ThrowableObject = Class{__includes = GameObject}

function ThrowableObject:init(def, x , y)
    GameObject.init(self, def, x, y)
    self.liftable = true
    self.thrown = false
    self.bumped = false
    self.direction = 'left'
    self.speed = 100
end

function ThrowableObject:fire(direction)
    self.direction = direction
    self.y = self.y + 5
    self.thrown = true
end

function ThrowableObject:update(dt)
    if self.thrown then
        if self.direction == 'left' then
            self.x = self.x - self.speed * dt

            if self.x <= MAP_RENDER_OFFSET_X + TILE_SIZE then
                self.x = MAP_RENDER_OFFSET_X + TILE_SIZE
                self.bumped = true
            end
        elseif self.direction == 'right' then
            self.x = self.x + self.speed * dt

            if self.x + self.width >= VIRTUAL_WIDTH - TILE_SIZE * 2 then
                self.x = VIRTUAL_WIDTH - TILE_SIZE * 2 - self.width
                self.bumped = true
            end
        elseif self.direction == 'up' then
            self.y = self.y - self.speed * dt

            if self.y <= MAP_RENDER_OFFSET_Y + TILE_SIZE - self.height / 2 then
                self.y = MAP_RENDER_OFFSET_Y + TILE_SIZE - self.height / 2
                self.bumped = true
            end
        elseif self.direction == 'down' then
            self.y = self.y + self.speed * dt

            local bottomEdge = VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE)
                + MAP_RENDER_OFFSET_Y - TILE_SIZE

            if self.y + self.height >= bottomEdge then
                self.y = bottomEdge - self.height
                self.bumped = true
            end
        end
    end
end
