Game = Object:extend()
require "game/classes/mouse"
require "game/classes/world"

DEBUGGING = true

function Game:new()
  --mainMouse = Mouse(10, 10, 32, 32)
  --mainMouse = Mouse()
  
  if not mainMouse then
    print("mainMouse Not Loaded")
  end
  mainMouse = Mouse(10, 10, 32, 32)
  world = World(mainMouse)
end

function Game:update(dt) 
  if not mainMouse then
    print("mainMouse Not Loaded")
  end
  mainMouse:update(dt)
  
  world:update(dt, mainMouse)
end


function Game:draw()
  if not mainMouse then
    print("mainMouse Not Loaded")
  end
  
  world:draw()
  world:drawMap()
  
  mainMouse:draw()

end