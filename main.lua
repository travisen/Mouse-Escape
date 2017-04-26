DEBUGGING = true -- true to turn debugging on.

function love.load()
  Object = require "libs/classic"
  require "game/game"

  game = Game()
  --img = "assets/mouse1female.png"
  --image = love.graphics.newImage(img)
end
 
-- Update game objects
function love.update(dt)
  game:update(dt)
end
 
function love.draw()
  game:draw()
  --love.graphics.draw(image)
end