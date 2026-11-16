-- Headless smoke test: boots the game, plays through every stage and exits.
-- Run from the repository root with: love . --smoke
local Map = require 'map'
local Player = require 'player'

local Smoke = {}

local FRAME_TIME = 1 / 60
local FRAMES_PER_STAGE = 90 -- let physics, enemy AI and combat run before clearing the stage
local TIMEOUT_FRAMES = 60 * 30

local function fail(message)
    print("SMOKE TEST FAILED: " .. message)
    os.exit(1)
end

function Smoke.install()
    function love.errorhandler(message)
        print(debug.traceback(tostring(message), 2))
        fail("the game raised an error")
    end

    local gameUpdate = love.update
    local totalFrames, stageFrames = 0, 0
    local stage -- set on the first frame, after love.load has built the first stage

    love.update = function()
        gameUpdate(FRAME_TIME)
        if not stage then
            stage = Map.currentStage
            print("Stage " .. stage .. " loaded")
        end
        totalFrames = totalFrames + 1
        stageFrames = stageFrames + 1
        Player.health.current = Player.health.max -- keep the test focused on stage flow

        if Map.completed then
            print("PASS: all " .. Map.maxStages .. " stages cleared in " .. totalFrames .. " frames")
            love.event.quit(0)
            return
        end

        if Map.currentStage ~= stage then
            if Map.currentStage ~= stage + 1 then
                fail("expected stage " .. (stage + 1) .. " but loaded stage " .. Map.currentStage)
            end
            stage = Map.currentStage
            stageFrames = 0
            print("Stage " .. stage .. " loaded")
        end

        if stageFrames > FRAMES_PER_STAGE then
            -- Clear the stage: count every enemy as defeated and move the player to the exit.
            Player.kills = #Map.enemies.objects
            Player.physics.body:setPosition(MapWidth - 8, Player.y)
        end

        if totalFrames > TIMEOUT_FRAMES then
            fail("timed out on stage " .. stage)
        end
    end
end

return Smoke
