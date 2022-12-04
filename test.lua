local Player = require('player')
local anim8 = require('libraries.anim8')
local cron = require('libraries.cron')
local start_time = love.timer:getTime()

local Skeleton = {}
local metaSkeleton = {}
metaSkeleton.__index = Skeleton

local activeSkeletons = {}

function Skeleton.new(x, y)
    local instance = {}
    setmetatable(instance, metaSkeleton)

    instance.x = x
    instance.y = y
    instance.width = 32
    instance.height = 64
    instance.speed = 40
    instance.xVel = instance.speed
    instance.direction = "right"
    instance.health = { current = 50, max = 50 }
    instance.range = { left = instance.x - 100, right = instance.x + 100 }
    instance.attackRange = 16.6
    instance.damage = 5

    instance.color = {
        red = 1,
        green = 1,
        blue = 1,
        speed = 3
    }

    instance.isAttacking = false
    instance.alive = true

    instance.animations = {}
    instance.animations.right = anim8.newAnimation(Skeleton.grid('2-7', 1), 0.2)
    instance.animations.left = anim8.newAnimation(instance.grid('2-7', 1), 0.2)
    instance.animations.idle = anim8.newAnimation(instance.grid('1-1', 1), 0.01)
    instance.animations.attack = anim8.newAnimation(instance.grid('5-9', 3), 0.5)

    instance.animations.death = {}
    instance.animations.falling = anim8.newAnimation(instance.grid('2-3', 6), 0.2, 'pauseAtEnd')
    instance.animations.falling1 = anim8.newAnimation(instance.grid('4-4', 6), 0.2)
    instance.animations.death[1] = anim8.newAnimation(instance.grid('5-5', 6), 0.01)
    instance.animations.death[2] = anim8.newAnimation(instance.grid('6-6', 6), 0.01)

    instance.currentAnim = instance.animations.idle

    instance.physics = {}
    instance.physics.body = love.physics.newBody(World, instance.x, instance.y, "dynamic")
    instance.physics.body:setFixedRotation(true)
    instance.physics.shape = love.physics.newRectangleShape(instance.width / 2, instance.height * 0.75)
    instance.physics.fixture = love.physics.newFixture(instance.physics.body, instance.physics.shape)
    table.insert(activeSkeletons, instance)
end

function Skeleton.loadAssets()
    Skeleton.spriteSheet = love.graphics.newImage('assets/skeleton/skeleton_sheet.png')
    Skeleton.grid = anim8.newGrid(32, 64, Skeleton.spriteSheet:getWidth(),
        Skeleton.spriteSheet:getHeight())
end

local hurt = cron.every(0.3, function()
    for _, instance in ipairs(activeSkeletons) do
        instance.health.current = instance.health.current - Player.damage
    end
end)

local hurtPlayer = cron.every(0.5, function()
    for _, instance in ipairs(activeSkeletons) do
        Player.health.current = Player.health.current - instance.damage / #activeSkeletons
    end
end)

function Skeleton:tint()
    self.color.green = 0
    self.color.blue = 0
end

function Skeleton:untint(dt)
    self.color.red = math.min(self.color.red + self.color.speed * dt, 1)
    self.color.green = math.min(self.color.green + self.color.speed * dt, 1)
    self.color.blue = math.min(self.color.blue + self.color.speed * dt, 1)
end

function Skeleton:syncPhysics()
    self.x, self.y = self.physics.body:getPosition()
    self.physics.body:setLinearVelocity(self.xVel, 100)
end

function Skeleton:update(dt)
    self:untint(dt)
    self:syncPhysics()
    self:move()
    self:combat(dt)
    self:attacked(dt)
    self.currentAnim:update(dt)
    self:updateDeathAnims(dt)
end

function Skeleton:moveLeft()
    self.direction = "left"
    self.xVel = -self.speed
    self.currentAnim = self.animations.left
end

function Skeleton:moveRight()
    self.direction = "right"
    self.xVel = self.speed
    self.currentAnim = self.animations.right
end

function Skeleton:stop()
    self.xVel = 0
    self.currentAnim = self.animations.idle
end

function Skeleton:move()
    if self.alive then
        if Player.x > self.range.left and Player.x < self.x - self.attackRange then
            self:moveLeft()
            print(self.range.left)
        elseif Player.x < self.range.right and Player.x > self.x + self.attackRange then
            self:moveRight()
            print(self.range.right)
        else
            self:stop()
        end
    end
end

function Skeleton:combat(dt)
    local current_time = love.timer:getTime() - start_time
    if self.isAttacking then
        if math.floor(current_time) % 6 ~= 0 then
            self.currentAnim = self.animations.attack
            self:hurtPlayer(dt)
        else
            self.currentAnim = self.animations.idle
        end
    end
end

function Skeleton:hurtPlayer(dt)
    if Player.health.current > 0 then
        if Player.currentAnim ~= Player.animations.guard and Player.currentAnim ~= Player.animations.crouchGuard then
            hurtPlayer:update(dt)
            Player:tint()
        end
    else
        Player.health.current = 0
        Player.alive = false
    end
end

function Skeleton:attacked(dt)
    if self.isAttacking then
        if Player.currentAnim == Player.animations.attackCrouchedH or
            Player.currentAnim == Player.animations.attackH then
            hurt:update(dt)
            self:tint()
            if self.health.current < 0 then
                self.health.current = 0
                self:die()
            end
        end
    end
end

function Skeleton:die()
    self.isAttacking = false
    self.alive = false
    self.xVel = 0
    self.currentAnim = self.animations.falling
end

function Skeleton:updateDeathAnims(dt)
    for _, death in ipairs(self.animations.death) do
        death:update(dt)
    end
end

function Skeleton.beginContact(a, b, collision)
    for _, instance in ipairs(activeSkeletons) do
        if a == instance.physics.fixture or b == instance.physics.fixture then
            if a == Player.physics.fixture or b == Player.physics.fixture then
                if instance.health.current > 0 then
                    instance.isAttacking = true
                end
            end
        end
    end
end

function Skeleton.endContact(a, b, collision)
    for _, instance in ipairs(activeSkeletons) do
        if a == instance.physics.fixture or b == instance.physics.fixture then
            if a == Player.physics.fixture or b == Player.physics.fixture then
                instance.isAttacking = false
            end
        end
    end
end

function Skeleton:draw()
    local xScale = 1
    if self.direction == "right" then
        xScale = 1
    elseif self.direction == "left" then
        xScale = -1
    end

    love.graphics.setColor(self.color.red, self.color.green, self.color.blue)
    self.currentAnim:draw(Skeleton.spriteSheet, self.x, self.y - 8, 0, xScale, 1, self.width / 2, self.height / 2)
    love.graphics.setColor(1, 1, 1, 1)
end

function Skeleton.drawAll()
    for _, instance in ipairs(activeSkeletons) do
        instance:draw()
    end
end

function Skeleton.updateAll(dt)
    for _, instance in ipairs(activeSkeletons) do
        instance:update(dt)
    end
end

return Skeleton
