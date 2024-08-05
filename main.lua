-- ---@type love
-- local love = require("love")

local function startRNG()
	local seed = math.floor(os.time())
	math.randomseed(seed)
end

local function distanceBetween(x1, y1, x2, y2)
	return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

local function randomPosition(obj)
	obj.x = math.random(0, love.graphics.getWidth())
	obj.y = math.random(0, love.graphics.getHeight())
end

local function wiggle(obj, limit)
	if obj.radius >= limit then
		obj.radius = obj.radius + math.random(-30, 0)
	elseif obj.radius < limit then
		obj.radius = obj.radius + math.random(0, 30)
	end
	obj.x = obj.x + math.random(-2, 2)
	obj.y = obj.y + math.random(-2, 2)
end

function love.load()
	Ball = { x = 0, y = 0, radius = 50 }
	Score = 0
	Timer = 0
	Font = love.graphics.newFont(69)

	startRNG()
end

function love.update(dt)
	wiggle(Ball, 60)
end

local function rgbColor(r, g, b)
	r, g, b = r / 255, g / 255, b / 255
	return r, g, b
end

function love.draw()
	love.graphics.setColor(rgbColor(51, 255, 255))
	love.graphics.circle("fill", Ball.x, Ball.y, Ball.radius)

	love.graphics.setColor(rgbColor(255, 255, 255))
	love.graphics.setFont(Font)
	love.graphics.print(Score, 20, 5)
end

function love.mousepressed(x, y, button, istouch, presses)
	if button == 1 then
		local isOnTarget = distanceBetween(x, y, Ball.x, Ball.y)
		if isOnTarget < Ball.radius then
			Score = Score + 1
			randomPosition(Ball)
		end
	elseif button == 2 then
		Ball.x = x
		Ball.y = y
	end
end

-- Priority is to the last object drawn
