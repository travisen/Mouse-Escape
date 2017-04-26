Mouse = Object:extend()

function Mouse:new(x, y, width, height)
  self.health = 10
  self.x = x
  self.y = y
  self.width = width
  self.height = height
  self.speed = 600
  
  --self.img = "assets/mouse1.png"
  --self.image = love.graphics.newImage(img)
  self.img = "assets/graphics/mouse1female.png"
  self.image = love.graphics.newImage(self.img)
  if DEBUGGING == true then
    print("Mouse Object created")
  end
end

function Mouse:update(dt)
  local window_width = love.graphics.getWidth()
  local window_height = love.graphics.getHeight()
  
  if not self.ai then
    if love.keyboard.isDown("up") and self.y > 0 then
      self.y = self.y - self.speed * dt
    end
    if love.keyboard.isDown("down") and self.y + self.height < window_height then
      self.y = self.y + self.speed * dt
    end
    if love.keyboard.isDown("left") then
      self.x = self.x - self.speed * dt
    end
    if love.keyboard.isDown("right") then
      self.x = self.x + self.speed * dt
    end
  end
  
end

function Mouse:draw()
  --print(self.xPos, self.yPos, self.width, self.length)
  --love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
  love.graphics.draw(self.image, self.x, self.y)
  --love.graphics.rectangle("fill", 10, 10, 64, 64)
end