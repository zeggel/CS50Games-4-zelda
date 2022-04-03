PlayerLiftedIdleState = Class{__includes = EntityIdleState}

function PlayerLiftedIdleState:enter(params)
    self.entity:changeAnimation('lifted-idle-' .. self.entity.direction)
    
    -- render offset for spaced character sprite (negated in render function of state)
    self.entity.offsetY = 5
    self.entity.offsetX = 0
end

function PlayerLiftedIdleState:update(dt)
    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        self.entity:changeState('lifted-walk')
    end

    if self.entity.carry and (love.keyboard.wasPressed('space') or love.keyboard.wasPressed('return')) then
        local pot = self.entity.carry
        pot:fire(self.entity.direction)
        self.entity.carry = nil

        self.entity:changeState('idle')
    end

    -- if love.keyboard.wasPressed('space') then
    --     self.entity:changeState('swing-sword')
    -- end

    -- if love.keyboard.wasPressed('return') then
    --     self.entity:changeState('lift')
    -- end
end