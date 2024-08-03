-- ---@type love
-- local love = require("love")

function love.load()
	Meno = { x = 0, y = 0, radius = 50 }
	Pontao = 0
	Timer = 0
	Fontao = love.graphics.newFont(69)
end

function love.update(dt) end

local function rgbColor(r, g, b)
	r, g, b = r / 255, g / 255, b / 255
	return r, g, b
end

function love.draw()
	love.graphics.setColor(rgbColor(51, 255, 255))
	love.graphics.circle("fill", Meno.x, Meno.y, Meno.radius)

	love.graphics.setColor(rgbColor(255, 255, 255))
	love.graphics.setFont(Fontao)
	love.graphics.print(Timer, 20, 5)
end

-- Desenhar primeiro é o ultimo
