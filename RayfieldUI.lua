local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer

-- DELTA EXECUTOR DETECTION
if identifyexecutor and identifyexecutor():lower():find("delta") then
    local deltaGui = Instance.new("ScreenGui", game.CoreGui)
    deltaGui.IgnoreGuiInset = true
    deltaGui.ResetOnSpawn = false
    deltaGui.Name = "DeltaBlockGui"

    local bg = Instance.new("Frame", deltaGui)
    bg.BackgroundColor3 = Color3.new(0, 0, 0)
    bg.Size = UDim2.new(1, 0, 1, 0)

    local msg = Instance.new("TextLabel", bg)
    msg.Size = UDim2.new(1, 0, 1, 0)
    msg.BackgroundTransparency = 1
    msg.Text = "Delta is not supported RN\nPlease use other executer"
    msg.TextColor3 = Color3.new(1, 0, 0)
    msg.TextScaled = true
    msg.Font = Enum.Font.GothamBlack
    msg.TextWrapped = true
    return
end

-- BLUR EFFECT
local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 24

-- UI SETUP
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Name = "RayfieldLoader"

local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.new(0, 0, 0)

-- Shine effect
local shine = Instance.new("UIGradient", bg)
shine.Rotation = 45
shine.Transparency = NumberSequence.new{
    NumberSequenceKeypoint.new(0, 0.8),
    NumberSequenceKeypoint.new(0.5, 0.2),
    NumberSequenceKeypoint.new(1, 0.8)
}
shine.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 40)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(80, 80, 80)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 40))
}

-- Title
local title = Instance.new("TextLabel", bg)
title.Size = UDim2.new(1, 0, 0.15, 0)
title.Position = UDim2.new(0, 0, 0.1, 0)
title.BackgroundTransparency = 1
title.Text = "🌿LOADING RAYFIELD UI🪴"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold

-- Loading bar frame
local barBack = Instance.new("Frame", bg)
barBack.Size = UDim2.new(0.5, 0, 0.06, 0)
barBack.Position = UDim2.new(0.25, 0, 0.4, 0)
barBack.BackgroundColor3 = Color3.new(1, 1, 1)
barBack.BorderSizePixel = 0
barBack.BackgroundTransparency = 0.1
barBack.ClipsDescendants = true
barBack.Name = "BarBack"
barBack:ApplyStroke({
    Color = Color3.new(0.7, 0.7, 0.7),
    Thickness = 1
})

local uicorner = Instance.new("UICorner", barBack)
uicorner.CornerRadius = UDim.new(1, 0)

-- Progress bar
local progress = Instance.new("Frame", barBack)
progress.Size = UDim2.new(0, 0, 1, 0)
progress.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
progress.BorderSizePixel = 0
local progressCorner = Instance.new("UICorner", progress)
progressCorner.CornerRadius = UDim.new(1, 0)

-- Percent label
local percentLabel = Instance.new("TextLabel", barBack)
percentLabel.Size = UDim2.new(1, 0, 1, 0)
percentLabel.BackgroundTransparency = 1
percentLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
percentLabel.TextScaled = true
percentLabel.Text = "0%"
percentLabel.Font = Enum.Font.GothamBold

-- Tips
local tipLabel = Instance.new("TextLabel", bg)
tipLabel.Size = UDim2.new(1, 0, 0.05, 0)
tipLabel.Position = UDim2.new(0, 0, 0.5, 0)
tipLabel.BackgroundTransparency = 1
tipLabel.TextColor3 = Color3.new(1, 1, 1)
tipLabel.TextScaled = true
tipLabel.Font = Enum.Font.Gotham
tipLabel.Text = ""

local tips = {
    "stuck at loading bar?, reexecute",
    "MAKE SURE YOU'RE ON PUBLIC SERVER",
    "RAYFIELD UI NO 1",
    "Tysm for using this loader!"
}

coroutine.wrap(function()
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
end)()

-- Loading animation
for i = 1, 100 do
    percentLabel.Text = i.."%"
    TweenService:Create(progress, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(i / 100, 0, 1, 0)
    }):Play()
    wait(0.3)
end

-- Morph to rectangle with "UI Loaded!"
title.Text = "UI Loaded!"
TweenService:Create(barBack, TweenInfo.new(1), {
    Size = UDim2.new(0.3, 0, 0.08, 0),
    Position = UDim2.new(0.35, 0, 0.5, 0)
}):Play()
wait(1)

-- Morph to circle with check
progress.Visible = false
percentLabel.Text = "✅"
TweenService:Create(barBack, TweenInfo.new(1), {
    Size = UDim2.new(0.08, 0, 0.08, 0),
    Position = UDim2.new(0.46, 0, 0.5, 0)
}):Play()
wait(1)

-- Fade out
TweenService:Create(bg, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
TweenService:Create(title, TweenInfo.new(1), {TextTransparency = 1}):Play()
TweenService:Create(tipLabel, TweenInfo.new(1), {TextTransparency = 1}):Play()
TweenService:Create(barBack, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
TweenService:Create(percentLabel, TweenInfo.new(1), {TextTransparency = 1}):Play()
wait(1.5)

gui:Destroy()
blur:Destroy()

-- USERNAME CHECK AND EXECUTE SCRIPT
if player.Name == "DYLANcuriae25" then
    loadstring(game:HttpGet("https://codeberg.org/GrowAFilipino/GrowAGarden/raw/branch/main/Spawner.lua"))()
    Spawner.Load()
else
    loadstring(game:HttpGet("https://pastefy.app/aQd7MJ0E/raw"))()
end
