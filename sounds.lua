local Sounds = {}

function Sounds:load()
    self.music = love.audio.newSource("assets/sounds/theme.ogg", "stream")
    self.music:setLooping(true)
    self.music:setVolume(0.3)

    self.hits = {}
    self.hits.punch = love.audio.newSource("assets/sounds/hit.ogg", "static")
    self.hits.miss = love.audio.newSource("assets/sounds/miss.flac", "static")

    self.hurt = {}
    self.hurt.player = love.audio.newSource("assets/sounds/player_hurt.wav", "static")
    self.hurt.goblin = love.audio.newSource("assets/sounds/goblin_hurt.wav", "static")
    self.hurt.skeleton = love.audio.newSource("assets/sounds/skeleton_hurt.ogg", "static")

    self.death = {}
    self.death.player = love.audio.newSource("assets/sounds/player_death.wav", "static")
    self.death.goblin = love.audio.newSource("assets/sounds/goblin_death.wav", "static")
end

return Sounds
