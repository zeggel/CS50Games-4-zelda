PlayerLiftState = Class{__includes = BaseState}

function PlayerLiftState:init(player, dungeon)
    self.player = player

    self.player:changeAnimation('lift-' .. self.player.direction)
end

function PlayerLiftState:update(dt)
    -- if we've fully elapsed through one cycle of animation, change back to idle state
    if self.player.currentAnimation.timesPlayed > 0 then
        self.player.currentAnimation.timesPlayed = 0
        self.player:changeState('lifted-idle')
    end
end

function PlayerLiftState:render()
    local anim = self.player.currentAnimation

    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
    math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))
end
