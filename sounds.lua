local Sounds = {}

function Sounds:load()
    self.music = love.audio.newSource("assets/sounds/theme.ogg", "stream")
    self.music:setLooping(true)
    self.music:setVolume(0.5)

    self.hits = {}
    self.hits.punch = love.audio.newSource("assets/sounds/hit.ogg", "static")

    self.hurt = {}
    self.hurt.player = love.audio.newSource("assets/sounds/player_hurt.wav", "static")
    self.hurt.goblin = love.audio.newSource("assets/sounds/goblin_hurt.wav", "static")
    self.hurt.skeleton = love.audio.newSource("assets/sounds/skeleton_hurt.ogg", "static")

    self.death = {}
    self.death.player = love.audio.newSource("assets/sounds/player_death.wav", "static")
    self.death.goblin = love.audio.newSource("assets/sounds/goblin_death.wav", "static")

    self.move = {}
    self.move.jump = love.audio.newSource("assets/sounds/jump.ogg", "static")
    self.move.walk1 = love.audio.newSource("assets/sounds/grass1.flac", "static")
    self.move.walk2 = love.audio.newSource("assets/sounds/grass2.flac", "static")
end

return Sounds
