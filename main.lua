require("sprite")

love.load = function ()
  lg = love.graphics
  sprite = createSprite("imgs/sprite.png",{row=7,col=0},8,8)
  dont = createSprite("imgs/dontwalk.png",{row=7,col=0},16,16)
  human = createSprite("imgs/human.png",{row=5,col=0},16,18)
  createAnime(dont,{name="human", x=300,y=200,scale=10})
  lg.setBackgroundColor(1,1,1)
  man = sourceAnime("human")
end

love.draw = function ()
  drawAnime()
end

love.update = function (dt)
  timerAnime(dt)
  if love.keyboard.isDown("a") then
    man.sprite = human
    man.w = -10
    man.rotate = 1
    man.x = man.x - 10
  end
  if love.keyboard.isDown("d") then
    man.sprite = human
    man.w = 10
    man.rotate = 1
    man.x = man.x + 10
  end
  if love.keyboard.isDown("w") then
    man.sprite = human
    man.h = 10
    man.rotate = 1.5
    man.y = man.y - 10
  end
  if love.keyboard.isDown("s") then
    man.sprite = human
    man.h = -10
    man.rotate = -1.5
    man.y = man.y + 10
  end
end
