local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- GUI setup
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "PatchNoticeGui"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false

local bg = Instance.new("Frame", gui)
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.Size = UDim2.new(1, 0, 1, 0)

local label = Instance.new("TextLabel", bg)
label.Text = "This Script Is Temporary Patched"
label.TextColor3 = Color3.fromRGB(255, 0, 0)
label.Font = Enum.Font.GothamBlack
label.TextScaled = true -- ✅ Makes it auto-fit
label.BackgroundTransparency = 1
label.Size = UDim2.new(0.8, 0, 0.2, 0) -- width 80% of screen
label.AnchorPoint = Vector2.new(0.5, 0.5)
label.Position = UDim2.new(0.5, 0, 0.5, 0)
label.TextStrokeTransparency = 0.3
label.TextWrapped = true
label.ZIndex = 2

-- Floating animation
task.spawn(function()
	while true do
		local x = math.random(-10, 10)
		local y = math.random(-5, 5)
		local tween = TweenService:Create(label, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
			Position = UDim2.new(0.5, x, 0.5, y)
		})
		tween:Play()
		tween.Completed:Wait()
	end
end)

-- Kick after 10 seconds
task.delay(10, function()
	player:Kick("All spawner scripts is currently patched.")
end)
