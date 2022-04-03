PlayerLiftState = Class{__includes = BaseState}

function PlayerLiftState:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon

    self.player:changeAnimation('lift-' .. self.player.direction)
end

function PlayerLiftState:update(dt)
    -- if we've fully elapsed through one cycle of animation, change back to idle state
    if self.player.currentAnimation.timesPlayed > 0 then
        self.player.currentAnimation.timesPlayed = 0

        for k, object in pairs(self.dungeon.currentRoom.objects) do
            if object.liftable and self.player:collides(object) then
                object.liftable = false
                self.player.carry = object
                self.player:changeState('lifted-idle')
                break
            else
                self.player:changeState('idle')
            end
        end

        -- self.player:changeState('lifted-idle')
    end
end

function PlayerLiftState:render()
    local anim = self.player.currentAnimation

    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
    math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))
end
