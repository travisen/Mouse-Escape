--[[
  block.lua
    Base class for all collidable enviornmental blocks in game.
--]]

Block = Object:extend()

function Block:new()
  --love.graphics.newSpriteBatch()
end

function Block:update(dt)

end

function Block:draw()
  --[[for i=0,1000,32 do
    love.graphics.draw(tile1, i, i)
  end--]]
  
end