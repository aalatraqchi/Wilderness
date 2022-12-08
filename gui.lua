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
    self.kills.text1 = "Must Kill All Enemies Before Proceeding!"
    self.kills.text2 = "Enemies remaining: "

    self.objective = {}
    self.objective.x = 30
    self.objective.y = 400
    self.objective.text = "Kill all enemies and reach the end to proceed to the next stage!"
end

function GUI:update(dt)
    self:objectiveMessage()
end

function GUI:draw()
    self:displayHealth()
    self:objectiveMessage()
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
    love.graphics.print(self.kills.text1, self.kills.x, self.kills.y)
    love.graphics.print(self.kills.text2 .. total - Player.kills, self.kills.x, self.kills.y + 20)
end

function GUI:objectiveMessage()
    if Player.x <= Player.startX then
        love.graphics.setNewFont(16)
        love.graphics.print(self.objective.text, self.objective.x, self.objective.y)
    end
end

return GUI
