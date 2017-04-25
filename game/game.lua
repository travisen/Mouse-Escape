Game = Object:extend()
require "game/classes/mouse"

DEBUGGING = true

function Game:new()
  --mainMouse = Mouse(10, 10, 32, 32)
  --mainMouse = Mouse()
  
  if not mainMouse then
    print("mainMouse Not Loaded")
  end
  mainMouse = Mouse(10, 10, 32, 32)
end

function Game:update(dt) 
  if not mainMouse then
    print("mainMouse Not Loaded")
  end
  mainMouse:update(dt)
end


function Game:draw()
  if not mainMouse then
    print("mainMouse Not Loaded")
  end  
  mainMouse:draw()
end