function createSprite(sType, x, y)
    local sprite = {}
    sprite.type = sType
    sprite.x = x
    sprite.y = y
    sprite.img = love.graphics.newImage("Assets/images/hero-day-1.png")
    if sprite.type == "player" then 
        -- Not sure that i use it
        sprite.vx = 200
        sprite.vy = 0
        sprite.jumpSound = love.audio.newSource("Assets/sounds/sfx_movement_jump13.wav", "static")
        sprite.jumpSoundLand = love.audio.newSource("Assets/sounds/sfx_movement_jump13_landing.wav", "static")
    end
    return sprite
end

function addAnimation(sprite)
    -- body
    for n = 1, 8 do
        table.insert(sprite, n, love.graphics.newImage("Assets/images/hero-day-" .. n .. ".png") )
    end
end