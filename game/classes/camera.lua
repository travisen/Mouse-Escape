Camera = Object:extend()

function Camera:new(mouseX, mouseY)
  Cam = require "libs/hump/camera"

  camera = Cam(mouseX, mouseY) -- Instantiate camera to mouse's initial position.
  
end

function Camera:update(dt, player)
    --local dx,dy = player.x - cam.x, player.y - cam.y
    0camera:move(dx/2, dy/2)
end