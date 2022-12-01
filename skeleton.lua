local Player = require('player')
local anim8 = require('libraries/anim8')
local cron = require('libraries.cron')
local start_time = love.timer:getTime()

local skeleton = {}

function skeleton:load(x, y)
    self.x = x
    self.y = y
    self.width = 32
    self.height = 64
    self.speed = 40
    self.xVel = self.speed
    self.direction = "right"
    self.health = { current = 50, max = 50 }
    self.range = { left = self.x - 100, right = self.x + 100 }
    self.attackRange = 16.6
    self.damage = 10

    self.color = {
        red = 1,
        green = 1,
        blue = 1,
        speed = 3
    }


    self.isAttacking = false
    self.alive = true

    self.spriteSheet = love.graphics.newImage('assets/skeleton/skeleton_sheet.png')
    self.grid = anim8.newGrid(self.width, self.height, self.spriteSheet:getWidth(), self.spriteSheet:getHeight())

    self.animations = {}
    self.animations.right = anim8.newAnimation(self.grid('2-7', 1), 0.2)
    self.animations.left = anim8.newAnimation(self.grid('2-7', 1), 0.2)
    self.animations.idle = anim8.newAnimation(self.grid('1-1', 1), 0.01)
    self.animations.attack = anim8.newAnimation(self.grid('5-9', 3), 0.5)
    self.animations.death = anim8.newAnimation(self.grid('2-3', 6), 0.4, 'pauseAtEnd')
    self.currentAnim = self.animations.idle

    self.physics = {}
    self.physics.body = love.physics.newBody(World, self.x, self.y, "dynamic")
    self.physics.body:setFixedRotation(true)
    self.physics.shape = love.physics.newRectangleShape(self.width / 2, self.height * 0.75)
    self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)
end

local hurt = cron.every(0.3, function()
    skeleton.health.current = skeleton.health.current - Player.damage
end)

function skeleton:tint()
    self.color.green = 0
    self.color.blue = 0
end

function skeleton:untint(dt)
    self.color.red = math.min(self.color.red + self.color.speed * dt, 1)
    self.color.green = math.min(self.color.green + self.color.speed * dt, 1)
    self.color.blue = math.min(self.color.blue + self.color.speed * dt, 1)
end

function skeleton:update(dt)
    self:untint(dt)
    self:syncPhysics()
    self:move()
    self:combat(dt)
    self:attacked(dt)
    self.currentAnim:update(dt)
end

function skeleton:moveLeft()
    self.direction = "left"
    self.xVel = -self.speed
    self.currentAnim = self.animations.left
end

function skeleton:moveRight()
    self.direction = "right"
    self.xVel = self.speed
    self.currentAnim = self.animations.right
end

function skeleton:stop()
    self.xVel = 0
    self.currentAnim = self.animations.idle
end

function skeleton:move()
    if self.health.current > 0 then
        if Player.x > self.range.left and Player.x < self.x - self.attackRange then
            skeleton:moveLeft()
        elseif Player.x < self.range.right and Player.x > self.x + self.attackRange then
            skeleton:moveRight()
        else
            skeleton:stop()
        end
    end
end

function skeleton:combat(dt)
    local current_time = love.timer:getTime() - start_time
    if self.isAttacking then
        if math.floor(current_time) % 6 ~= 0 and math.floor(current_time) % 5 ~= 0 then
            self.currentAnim = self.animations.attack
            self:hurtPlayer(dt, 1, self.damage)
        else
            self.currentAnim = self.animations.idle
        end
    end
end

function skeleton:hurtPlayer(dt, t, dmg)
    local hurt = cron.every(t, function()
        Player:takeDamage(dt, dmg)
    end)
    if Player.currentAnim ~= Player.animations.guard and Player.currentAnim ~= Player.animations.crouchGuard then
        hurt:update(dt)
    end
end

function skeleton:attacked(dt)
    if self.isAttacking then
        if Player.currentAnim == Player.animations.attackCrouchedH or Player.currentAnim == Player.animations.attackH then
            hurt:update(dt)
            self:tint()
            if self.health.current < 0 then
                self.health.current = 0
                self:die()
            end
        end
    end
end

function skeleton:die()
    self.isAttacking = false
    self.xVel = 0
    self.currentAnim = self.animations.death
end

function skeleton:syncPhysics()
    self.x, self.y = self.physics.body:getPosition()
    self.physics.body:setLinearVelocity(self.xVel, 100)
end

function skeleton:beginContact(a, b, collision)
    if a == self.physics.fixture or b == self.physics.fixture then
        if a == Player.physics.fixture or b == Player.physics.fixture then
            if self.health.current > 0 then
                self.isAttacking = true
            end
        end
    end
end

function skeleton:endContact(a, b, collision)
    if a == self.physics.fixture or b == self.physics.fixture then
        if a == Player.physics.fixture or b == Player.physics.fixture then
            self.isAttacking = false
        end
    end
end

function skeleton:draw()
    local xScale = 1
    if self.direction == "right" then
        xScale = 1
    elseif self.direction == "left" then
        xScale = -1
    end
    love.graphics.setColor(self.color.red, self.color.green, self.color.blue)
    self.currentAnim:draw(self.spriteSheet, self.x, self.y - 8, nil, xScale, 1,
        self.width / 2, self.height / 2)
    love.graphics.setColor(1, 1, 1, 1)
end

return skeleton
