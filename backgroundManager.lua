function bgManager()
    if player.x < screenX / 2 then bg = level.bg1 
    elseif player.x >= screenX / 2 then bg = level.bg2 end
    love.graphics.draw(bg, bgX + bg:getWidth() , 0)
end