love.graphics.setDefaultFilter("nearest", "nearest")
local Player = require 'player'
local GUI = {}

function GUI:load()
    self.health = {}
    self.health.image = love.graphics.newImage('assets/heart.png')
    self.health.width = self.health.image:getWidth()
    self.health.height = self.health.image:getHeight()
    self.health.scale = 0.2
    self.health.x = 20
    self.health.y = 10

    self.kills = {}
    self.kills.x = 950
    self.kills.y = 400
end

function GUI:update(dt)

end

function GUI:draw()
    self:displayHealth()
end

function GUI:displayHealth()
    love.graphics.setColor(0, 0, 0, 0.5)
    love.graphics.draw(self.health.image, self.health.x + 2, self.health.y + 2, 0, self.health.scale, self.health.scale)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(self.health.image, self.health.x, self.health.y, 0, self.health.scale, self.health.scale)


    local x = self.health.x + self.health.width * self.health.scale
    local y = self.health.y + self.health.height * 0.5 * self.health.scale
    love.graphics.setNewFont(24)
    love.graphics.print(" : " .. Player.health.current, x, y)
end

function GUI:killsNeeded(total)
    love.graphics.setNewFont(14)
    love.graphics.print("Must Kill All Enemies Before Proceeding!", self.kills.x, self.kills.y)
    love.graphics.print("Enemies Remaining: " .. total - Player.kills, self.kills.x, self.kills.y + 20)
end

return GUI
