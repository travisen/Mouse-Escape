local sti = require "libs/sti/sti"

function love.load()
  Object = require "libs/classic"
  require "game/game"

  game = Game()

end
 

function love.update(dt)
  game:update(dt)
end
 
function love.draw()
  
  game:draw()

end