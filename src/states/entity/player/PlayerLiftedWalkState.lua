PlayerLiftedWalkState = Class{__includes = PlayerWalkState}

function PlayerLiftedWalkState:keyboardAction()
    if love.keyboard.isDown('left') then
        self.entity.direction = 'left'
        self.entity:changeAnimation('lifted-walk-left')
    elseif love.keyboard.isDown('right') then
        self.entity.direction = 'right'
        self.entity:changeAnimation('lifted-walk-right')
    elseif love.keyboard.isDown('up') then
        self.entity.direction = 'up'
        self.entity:changeAnimation('lifted-walk-up')
    elseif love.keyboard.isDown('down') then
        self.entity.direction = 'down'
        self.entity:changeAnimation('lifted-walk-down')
    else
        self.entity:changeState('lifted-idle')
    end

    -- if love.keyboard.wasPressed('space') then
    --     self.entity:changeState('swing-sword')
    -- end
end

function PlayerLiftedWalkState:update(dt)
    PlayerWalkState.update(self, dt)

    if self.entity.carry and (love.keyboard.wasPressed('space') or love.keyboard.wasPressed('return')) then
        local pot = self.entity.carry
        pot:fire(self.entity.direction)
        self.entity.carry = nil

        self.entity:changeState('idle')
    end
end
