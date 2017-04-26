World = Object:extend()

function World:new(mouse)
  img = "assets/graphics/32red.png"
  self.tile1 = love.graphics.newImage(img)
  -- our tiles
   self.tile = {}
   for i=0,3 do -- change 3 to the number of tile images minus 1.
      self.tile[i] = love.graphics.newImage( "assets/graphics/world/" .. i..".png" )
   end
 
   love.graphics.setNewFont(12)
   self.map={
   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
   { 0, 1, 0, 0, 2, 2, 2, 0, 3, 0, 3, 0, 1, 1, 1, 0, 0, 0, 0, 0},
   { 0, 1, 0, 0, 2, 0, 2, 0, 3, 0, 3, 0, 1, 0, 0, 0, 0, 0, 0, 0},
   { 0, 1, 1, 0, 2, 2, 2, 0, 0, 3, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0},
   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
   { 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0},
   { 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   { 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   { 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   { 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   { 0, 2, 2, 2, 0, 3, 3, 3, 0, 1, 1, 1, 0, 2, 0, 0, 0, 0, 0, 0},
   { 0, 2, 0, 0, 0, 3, 0, 3, 0, 1, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0},
   { 0, 2, 0, 0, 0, 3, 0, 3, 0, 1, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0},
   { 0, 2, 2, 2, 0, 3, 3, 3, 0, 1, 1, 1, 0, 2, 2, 2, 0, 0, 0, 0},
   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}
   -- map variables
   self.map_w = 20
   self.map_h = 20
   self.map_x = mouse.x--0 -- follow on screen
   self.map_y = mouse.y--0 --
   self.map_offset_x = 30
   self.map_offset_y = 30
   self.map_display_w = 14
   self.map_display_h = 10
   self.tile_w = 64
   self.tile_h = 64
   self.map_display_buffer = 1
end

function World:drawMap()
	offset_x = self.map_x % self.tile_w
	offset_y = self.map_y % self.tile_h
	firstTile_x = math.floor(self.map_x / self.tile_w)
	firstTile_y = math.floor(self.map_y / self.tile_h)
 
	for y=1, (self.map_display_h + self.map_display_buffer) do
		for x=1, (self.map_display_w + self.map_display_buffer) do
			-- Note that this condition block allows us to go beyond the edge of the map.
			if y+firstTile_y >= 1 and y+firstTile_y <= self.map_h
				and x+firstTile_x >= 1 and x+firstTile_x <= self.map_w
			then
				love.graphics.draw(
					self.tile[self.map[y+firstTile_y][x+firstTile_x]], 
					((x-1)*self.tile_w) - offset_x - self.tile_w/2, 
					((y-1)*self.tile_h) - offset_y - self.tile_h/2)
			end
		end
	end
end

function World:draw_map()
   for y=1, self.map_display_h do
      for x=1, self.map_display_w do                                                         
         love.graphics.draw( 
            self.tile[self.map[y+self.map_y][x+self.map_x]], 
            (x*self.tile_w)+self.map_offset_x, 
            (y*self.tile_h)+self.map_offset_y )
      end
   end
end

function World:update(dt, mouse)
  local speed = 400 * dt
  local mouseX = mouse.x
  local mouseY = mouse.y

	-- get input
	if love.keyboard.isDown( "up" ) then
		self.map_y = self.map_y - speed
	end
	if love.keyboard.isDown( "down" ) then
		self.map_y = self.map_y + speed
	end
 
	if love.keyboard.isDown( "left" ) then
		self.map_x = self.map_x - speed
	end
	if love.keyboard.isDown( "right" ) then
		self.map_x = self.map_x + speed
	end
	if love.keyboard.isDown( "escape" ) then
		love.event.quit()
	end
 
	--[[ check boundaries. remove this section if you don't wish to be constrained to the map.

	if self.map_x < 0 then
		self.map_x = 0
	end
 
	if self.map_y < 0 then
		self.map_y = 0
	end	

	if map_x > map_w * tile_w - map_display_w * tile_w - 1 then
		map_x = map_w * tile_w - map_display_w * tile_w - 1
	end
 
	if map_y > map_h * tile_h - map_display_h * tile_h - 1 then
		map_y = map_h * tile_h - map_display_h * tile_h - 1
	end
  --]]
end

function World:draw()
  --[[for i=0,1000,32 do
    love.graphics.draw(tile1, i, i)
  end--]]
  
  --love.graphics.draw(tile1, 10, 10)
end