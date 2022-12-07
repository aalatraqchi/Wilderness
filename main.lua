-- CS50 Final Project
-- Game with LOVE 2D

love.graphics.setDefaultFilter("nearest", "nearest")
local Player = require 'player'
local Camera = require 'camera'
local GUI = require 'gui'
local Skeleton = require 'skeleton'
local Map = require 'map'

function love.load()
    Skeleton.loadAssets()
    Map:load()
    Background = love.graphics.newImage('assets/purple background.jpg')
    GUI:load()
    Player:load()
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
    Map.stage:draw(-Camera.x, -Camera.y, Camera.scale, Camera.scale)

    Camera:apply()
    Player:draw()
    Skeleton.drawAll()
    Camera:clear()
    GUI:draw()
    Map:update()
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
