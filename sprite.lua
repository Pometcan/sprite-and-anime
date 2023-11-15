local anime = {}
--Sprite Create
function createSprite(img,fCounts,w,h)
  if type(img) == type("") then
    img = love.graphics.newImage(img) 
    img:setFilter("nearest","nearest")
  end
  local frame = {}
  frame.img = img
  for i=0,fCounts.col do
    for j=0,fCounts.row do
      table.insert(frame,love.graphics.newQuad(j*w,i*h,w,h,img:getDimensions()))
    end
  end
  return frame
end

function createAnime(sprite,stuff)
  local ani = {
    name = stuff.name or "",
    sprite = sprite,
    timer=stuff.timer or 1,
    duration = stuff.duration or 1,
    x = stuff.x or 0,
    y = stuff.y or 0,
    rotate = stuff.rotate or 0,
    w = stuff.w or 1,
    h = stuff.h or 1, 
    ox = stuff.ox or 0,
    oy = stuff.oy or 0,
    kx = stuff.kx or 0,
    ky = stuff.ky or 0
  }
  if stuff.scale ~= nil then
    ani.w = stuff.scale
    ani.h = stuff.scale
  end
  table.insert(anime,ani)
end

function timerAnime(dt)
  for _, ani in ipairs(anime) do
    ani.timer = ani.timer + dt
    if ani.timer >= ani.duration then
      ani.timer = ani.timer - ani.duration
    end 
  end
end

function drawAnime()
  for _, ani in ipairs(anime) do
    local spriteNumber = math.floor(ani.timer/ani.duration*#ani.sprite)+1 
    love.graphics.draw(ani.sprite.img,ani.sprite[spriteNumber],ani.x,ani.y,ani.rotate,ani.w,ani.h,ani.ox,ani.oy,ani.kx,ani.ky)
  end
end

function sourceAnime(source)
  if type(source) == "string" then
    for _, v in ipairs(anime) do
      if v.name == source then
        return v
      end
    end
  end
end
