-- CS50 Final Project
-- Game with LOVE 2D

love.graphics.setDefaultFilter("nearest", "nearest")
local STI = require('sti')
local Player = require('player')
local Camera = require('camera')
local GUI = require('gui')
local Skeleton = require('skeleton')

function love.load()
    Map = STI('map/1.lua', { 'box2d' })
    World = love.physics.newWorld(0, 0)
    World:setCallbacks(BeginContact, EndContact)
    Map:box2d_init(World)
    Map.layers.collidable.visible = false
    Map.layers.enemies.visible = false
    MapWidth = Map.layers.ground.width * 32
    Background = love.graphics.newImage('assets/purple background.jpg')
    GUI:load()
    Skeleton.loadAssets()
    Player:load()
    SpawnEnemies()
end

function love.update(dt)
    World:update(dt)
    Player:update(dt)
    Skeleton.updateAll(dt)
    Camera:setPosition(Player.x, 0)
    GUI:update(dt)
end

function love.draw()
    love.graphics.draw(Background, 0, 0, 0, 0.5, 0.5)
    Map:draw(-Camera.x, -Camera.y, Camera.scale, Camera.scale)

    Camera:apply()
    Player:draw()
    Skeleton.drawAll()
    Camera:clear()
    GUI:draw()
end

function love.keypressed(key)
    Player:jump(key)
end

function BeginContact(a, b, collision)
    Skeleton.beginContact(a, b, collision)
    Player:beginContact(a, b, collision)
end

function EndContact(a, b, collision)
    Skeleton.endContact(a, b, collision)
    Player:endContact(a, b, collision)
end

function SpawnEnemies()
    for _, object in ipairs(Map.layers.enemies.objects) do
        if object.class == "skeleton" then
            Skeleton.new(object.x + object.width / 2, object.y + object.height / 2)
        end
    end
end
