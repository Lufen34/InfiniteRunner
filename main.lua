require("sprites")
require("input")
require("backgroundManager")
require("backgroundMusicManager")

level = {}
level.bg1 = love.graphics.newImage("Assets/images/forest.png")
level.bg2 = love.graphics.newImage("Assets/images/volcano.png")

love.graphics.setFont(love.graphics.newFont(30))

local bgM = {}
bgM = addBgm(bgM, "Assets/musics/cool.mp3")
bgM = addBgm(bgM, "Assets/musics/techno.mp3")
bgX = 1
bg = level.bg1

player = {}

frame = 1

function start()
    -- body
    player = createSprite("player", 0, level.ground)
    addAnimation(player)
end

function love.load()
    -- Window settings
    love.window.setTitle("----------- Infinite Runner by Lufen -----------")
    love.window.setMode(1000, 400)
    screenX = love.graphics.getWidth()
    screenY = love.graphics.getHeight()
    -- Game settings
    level.ground = screenY - 52
    start()
end

function love.update(dt)
    -- body
    handleInput(dt)
    bgX = bgX - 120 * dt
    if bgX <= 0 - level.bg1:getWidth() then 
        bgX = 1
    end

    frame = frame + 12 * dt
    if frame > 8 then frame = 1 end

     bgMusicManager(bgM, dt)
end

function love.draw( ... )
    -- body
    love.graphics.draw(bg, bgX, 0)
    bgManager()
    love.graphics.line(screenX / 2, 0, screenX / 2, screenY)
    love.graphics.draw(player[math.floor(frame)], player.x, player.y, 0, 1.5, 1.5)
end