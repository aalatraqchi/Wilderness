local STI = require 'sti'
local Player = require 'player'
local Skeleton = require 'skeleton'
local GUI = require 'gui'
local Goblin = require 'goblin'
local Centurion = require 'centurion'

local Map = {}

function Map:load()
    self.currentStage = 1
    World = love.physics.newWorld(0, 0)
    World:setCallbacks(BeginContact, EndContact)


    self:initialize()
end

function Map:initialize()
    self.stage = STI("map/" .. self.currentStage .. ".lua", { 'box2d' })
    self.stage:box2d_init(World)
    self.collidables = self.stage.layers.collidable
    self.enemies = self.stage.layers.enemies
    self.ground = self.stage.layers.ground

    self.collidables.visible = false
    if #self.enemies.objects > 0 then
        self.enemies.visible = false
    end
    MapWidth = self.ground.width * 32

    self:spawnEnemies()
end

function Map:nextStage()
    self:clearPrevious()
    self.currentStage = self.currentStage + 1
    self:initialize()
    Player:resetPosition()
end

function Map:clearPrevious()
    self.stage:box2d_removeLayer("collidable")
    Skeleton.clearAll()
    Goblin.clearAll()
end

function Map:update()
    if Player.x > MapWidth - 32 then
        if Player.kills == #self.enemies.objects then
            Map:nextStage()
            Player.kills = 0
        else
            GUI:killsNeeded(#self.enemies.objects)
        end
    end
end

function Map:spawnEnemies()
    for _, object in ipairs(self.enemies.objects) do
        if object.class == "skeleton" then
            Skeleton.new(object.x + object.width / 2, object.y + object.height / 2)
        elseif object.class == "goblin" then
            Goblin.new(object.x + object.width / 2, object.y + object.height / 2)
        elseif object.class == "centurion" then
            Centurion.new(object.x + object.width / 2, object.y + object.height / 2)
        end
    end
end

return Map
