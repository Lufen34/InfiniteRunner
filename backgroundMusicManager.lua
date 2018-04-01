local musicID = 1
local volumeA = 0
local volumeB = 0
local volumeSpeed = 1
local volumeDownSpeed = 3
love.audio.setVolume(0)

function addBgm(bgM, source)
    table.insert(bgM, musicID, love.audio.newSource(source, "stream"))
    musicID = musicID + 1
    return bgM
end

function bgMusicManager(bgM, dt)
    if player.x < (screenX/2) - player.img:getWidth() then
        volumeB = volumeB - volumeDownSpeed * dt
        love.audio.setVolume(volumeB)
        if volumeB <= 0 then volumeB = 0 end
        if volumeB == 0 then 
            love.audio.stop(bgM[2]) 
            love.audio.play(bgM[1])
            volumeA = volumeA + volumeSpeed * dt
            love.audio.setVolume(volumeA)
        end
    elseif player.x >= (screenX/2) then
        volumeA = volumeA - volumeDownSpeed * dt
        love.audio.setVolume(volumeA)
        if volumeA <= 0 then volumeA = 0 end
        if volumeA == 0 then 
            love.audio.stop(bgM[1])
            love.audio.play(bgM[2])
            volumeB = volumeB + volumeSpeed * dt
            love.audio.setVolume(volumeB)
        end
    end
end