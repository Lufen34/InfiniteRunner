local jumpReady = true
local jumpHeight = 400
local gravity = -800

function handleInput(dt)
    -- body
    if love.keyboard.isDown("d") then 
        player.x = player.x + player.vx * dt
        if player.x > screenX - player.img:getWidth() then player.x = screenX - player.img:getWidth() end
    end

    if love.keyboard.isDown("q") then 
        player.x = player.x - player.vx * dt
        if player.x < 0 then player.x = 0 end
    end

    if love.keyboard.isDown("space") then 
        if jumpReady == true then 
            jumpReady = false 
            player.vy = jumpHeight
            love.audio.play(player.jumpSound)
        end
    end

    if jumpReady == false then 
        player.y = player.y - player.vy * dt
        player.vy = player.vy + gravity * dt
        if player.y >= level.ground then 
            player.vy = 0
            player.y = level.ground
            love.audio.play(player.jumpSoundLand)
            jumpReady = true
        end
    end

    if love.keyboard.isDown("escape") then 
        love.event.quit()
    end
end