-- CS50 Final Project
-- Game with LOVE 2D

love.graphics.setDefaultFilter("nearest", "nearest")
local STI = require('sti')
local Player = require('player')
local Camera = require('camera')
--local skeleton = require('skeleton')
local GUI = require('gui')
local Skeleton = require('test')

function love.load()
    Map = STI('map/1.lua', { 'box2d' })
    World = love.physics.newWorld(0, 0)
    World:setCallbacks(BeginContact, EndContact)
    Map:box2d_init(World)
    Map.layers.Solid.visible = false
    Map.layers.Enemies.visible = false
    MapWidth = Map.layers.Ground.width * 32
    Background = love.graphics.newImage('assets/purple background.jpg')
    GUI:load()
    Skeleton.loadAssets()
    Player:load()
    for _, object in pairs(Map.layers.Enemies.objects) do
        Skeleton.new(object.x + object.width / 2, object.y + object.height / 2)
    end
end

function love.update(dt)
    World:update(dt)
    Player:update(dt)
    Skeleton.updateAll(dt)
    Camera:setPosition(Player.x, 0)
    --skeleton:update(dt)
    GUI:update(dt)
end

function love.draw()
    love.graphics.draw(Background, 0, 0, 0, 0.5, 0.5)
    Map:draw(-Camera.x, -Camera.y, Camera.scale, Camera.scale)

    Camera:apply()
    Player:draw()
    Skeleton.drawAll()
    --skeleton:draw()
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
    for _, object in ipairs(Map.layers.Enemies.objects) do
        --if object.class == "skeleton" then
        Skeleton.new(object.x + object.width / 2, object.y + object.height / 2)
        --end
    end
end
