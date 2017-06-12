
Mouse = Object:extend()
--- Create main character
-- Constructor for mouse object.
-- Instantiates and then returns
-- a mouse object.
-- @x position on x axis
-- @y position on y axis
-- @width
-- @height
function Mouse:new(x, y, width, height)
  self.health = 10
  self.x = x
  self.y = y
  self.width = width
  self.height = height
  self.speed = 400
  
  self.img = "assets/characters/femaleMouse.png"
  self.image = love.graphics.newImage(self.img)
end

--- Move main character (player1)
-- Handles the movement of the main character
-- by updating position based on key presses
-- and current position.
-- @dt 
function Mouse:move(dt)
  local window_width = love.graphics.getWidth()
  local window_height = love.graphics.getHeight()
  
  -- Cushion to move actual border closer
  -- to the center of screen. Prevents 
  -- part of mouse object being obstructed
  -- by screen borders.
  local x_Margin = 40 
  local y_Margin = 30
  

  if love.keyboard.isDown("up") and self.y > 0 then
    self.y = self.y - self.speed * dt
  end
  if love.keyboard.isDown("down") and self.y + self.height + y_Margin < window_height then
    self.y = self.y + self.speed * dt
  end
  if love.keyboard.isDown("left") and self.x > 0 then
    self.x = self.x - self.speed * dt
  end
  if love.keyboard.isDown("right") and self.x + self.width + x_Margin< window_width then
    self.x = self.x + self.speed * dt
  end
end

--- Draws mouse to screen
function Mouse:draw()

  love.graphics.draw(self.image, self.x, self.y)
  
end