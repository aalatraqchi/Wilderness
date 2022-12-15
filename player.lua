local anim8 = require 'libraries.anim8'
local Sounds = require 'sounds'
local cron = require 'libraries.cron'
local Player = {}

function Player:load()
    self.x = 30
    self.y = 0
    self.startX = self.x
    self.startY = self.y
    self.width = 32
    self.height = 64
    self.xVel = 0
    self.yVel = 0
    self.maxSpeed = 100
    self.acceleration = 4000
    self.friction = 3500
    self.gravity = 1500
    self.jumpAmount = -500
    self.direction = "right"
    self.health = { current = 100, max = 100 }
    self.damage = 10
    self.kills = 0

    self.color = {
        red = 1,
        green = 1,
        blue = 1,
        speed = 3
    }

    self.alive = true
    self.grounded = false
    self.crouched = false
    self.hasDoubleJump = true

    self:loadAssets()

    self.physics = {}
    self.physics.body = love.physics.newBody(World, self.x, self.y, "dynamic")
    self.physics.body:setFixedRotation(true)
    self.physics.shape = love.physics.newRectangleShape(self.width / 2, self.height * 0.75)
    self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)
end

function Player:loadAssets()
    self.spriteSheet = love.graphics.newImage('assets/player/player_sheet.png')
    self.grid = anim8.newGrid(32, 64, self.spriteSheet:getWidth(), self.spriteSheet:getHeight())

    self.animations = {}
    self.animations.walk = anim8.newAnimation(self.grid('2-7', 1), 0.2)
    self.animations.idle = anim8.newAnimation(self.grid('1-1', 1), 0.01)
    self.animations.jump = anim8.newAnimation(self.grid('8-10', 2), 0.5)
    self.animations.crouch = anim8.newAnimation(self.grid('10-10', 1), 0.01)
    self.animations.attack = anim8.newAnimation(self.grid('5-9', 3), 0.2) -- horizontal attack animations
    self.animations.guard = anim8.newAnimation(self.grid('10-10', 3), 0.01)
    self.animations.attackCrouched = anim8.newAnimation(self.grid('5-9', 4), 0.2) -- horizontal attack animations
    self.animations.crouchGuard = anim8.newAnimation(self.grid('10-10', 4), 0.01)

    self.currentAnim = self.animations.idle
end

local walk1 = cron.every(0.5, function()
    Sounds.move.walk1:play()
end)

local walk2 = cron.every(1, function()
    Sounds.move.walk2:play()
end)

function Player:respawn()
    if not self.alive then
        Sounds.death.player:play()
        self:resetPosition()
        self.health.current = self.health.max
        self.alive = true
    end
end

function Player:resetPosition()
    self.physics.body:setPosition(self.startX, self.startY)
end

function Player:tint()
    self.color.green = 0
    self.color.blue = 0
end

function Player:untint(dt)
    self.color.red = math.min(self.color.red + self.color.speed * dt, 1)
    self.color.green = math.min(self.color.green + self.color.speed * dt, 1)
    self.color.blue = math.min(self.color.blue + self.color.speed * dt, 1)
end

function Player:update(dt)
    self:untint(dt)
    self:respawn()
    self:syncPhysics()
    self:move(dt)
    self:moveSounds(dt)
    self:jump()
    self:crouch()
    self:attack()
    self:applyGravity(dt)
    self.currentAnim:update(dt)
    self:setDirection()
end

function Player:setDirection()
    if self.xVel < 0 then
        self.direction = "left"
    elseif self.xVel > 0 then
        self.direction = "right"
    end
end

function Player:applyGravity(dt)
    if self.grounded == false then
        self.yVel = self.yVel + self.gravity * dt
        self.currentAnim = self.animations.jump
    end
end

function Player:move(dt)
    if love.keyboard.isDown('d') then
        self.xVel = math.min(self.xVel + self.acceleration * dt, self.maxSpeed) -- this ensures you cannot accelerate past max speed
        self.currentAnim = self.animations.walk
    elseif love.keyboard.isDown('a') then
        self.xVel = math.max(self.xVel - self.acceleration * dt, -self.maxSpeed) -- same thing here but flipped since going to the left is negative
        self.currentAnim = self.animations.walk
    else
        self:applyFriction(dt)
    end
end

function Player:moveSounds(dt)
    if self.grounded then
        if self.xVel ~= 0 then
            if self.maxSpeed == 100 then
                walk1:update(dt)
                walk2:update(dt)
            end
        end
    end
end

function Player:attack()
    if love.keyboard.isDown('j') then
        if self.crouched then
            self.currentAnim = self.animations.attackCrouched
        else
            self.currentAnim = self.animations.attack
        end
        self.xVel = 0
        self:changeDirection()
    elseif love.keyboard.isDown('k') then
        if self.crouched then
            self.currentAnim = self.animations.crouchGuard
        else
            self.currentAnim = self.animations.guard
        end
        self.xVel = 0
        self:changeDirection()
    end
end

function Player:applyFriction(dt)
    self.xVel = math.max(0, self.xVel - self.friction * dt)
    self.xVel = math.min(self.xVel + self.friction * dt, 0)
    self.currentAnim = self.animations.idle
end

function Player:syncPhysics()
    self.x, self.y = self.physics.body:getPosition()
    self.physics.body:setLinearVelocity(self.xVel, self.yVel)
end

function Player:beginContact(a, b, collision) -- the object loaded first will always be object a
    if self.grounded == true then return end -- if player is already on the ground, return end
    local nx, ny = collision:getNormal() -- will return x and y values based on which is in front/behind, or on top/below. -1 y will indicate object b is below object a
    if a == self.physics.fixture then
        if ny > 0 then -- if the player is a, then a positive ny value will indicate that the player is on top
            self:land(collision)
        elseif ny < 0 then
            self.yVel = 0
        end
    elseif b == self.physics.fixture then
        if ny < 0 then -- if the player is b, then a negative ny value will indicate that the player is on top
            self:land(collision)
        elseif ny > 0 then
            self.yVel = 0
        end
    end
end

function Player:land(collision)
    self.currentGroundCollision = collision
    self.yVel = 0
    self.grounded = true
    self.hasDoubleJump = true
end

function Player:jump(key)
    if key == 'w' or key == 'space' then
        if self.grounded then
            self.yVel = self.jumpAmount
        elseif self.hasDoubleJump then
            self.hasDoubleJump = false
            self.yVel = self.jumpAmount * 0.9
        end
        Sounds.move.jump:play()
    end
end

function Player:crouch()
    if love.keyboard.isDown('s') and self.grounded then
        self.currentAnim = self.animations.crouch
        self.xVel = 0
        self:changeDirection()
        self.crouched = true
    else
        self.crouched = false
    end
end

function Player:changeDirection()
    if love.keyboard.isDown('a') then -- these two if statements allow you to change direction of guard without moving
        self.direction = "left"
    elseif love.keyboard.isDown('d') then
        self.direction = "right"
    end
end

function Player:endContact(a, b, collision)
    if a == self.physics.fixture or b == self.physics.fixture then -- it doesn't matter which one the player is because we are just checking if the collision ended b/w a & b
        if self.currentGroundCollision == collision then -- if the current collision from land is the same as the collision that ended, then the player is no longer grounded
            self.grounded = false
        end
    end
end

function Player:draw()
    local xScale = 1
    if self.direction == "right" then
        xScale = 1
    elseif self.direction == "left" then
        xScale = -1
    end
    love.graphics.setColor(self.color.red, self.color.green, self.color.blue)
    self.currentAnim:draw(self.spriteSheet, self.x, self.y - 8, nil, xScale, 1, self.width / 2, self.height / 2)
    love.graphics.setColor(1, 1, 1, 1)
end

return Player
