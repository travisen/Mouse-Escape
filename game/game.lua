Game = Object:extend()
require "game/classes/mouse"
require "game/classes/world"
Camera = require "libs/hump/camera"


DEBUGGING = true
--- Create game object
-- Loads all necessary objects required
-- to start a game. Loads, main player,
-- map, npc's, and music assets.
function Game:new()
  
  player1 = Mouse(10, 10, 32, 32)
  if not mainMouse then
    print("mainMouse Not Loaded")
  end  
  
end

function Game:update(dt) 

  player1:move(dt)
end


function Game:draw()
  
  love.graphics.setBackgroundColor(200,230,230)
  player1:draw()

end