-- Delta Autoexec Ban GUI with floating + shaking animation and auto-kick

pcall(function()
    -- Destroy existing GUI
    local gui = game:GetService("CoreGui"):FindFirstChild("AccountBannedGUI")
    if gui then gui:Destroy() end

    -- GUI Setup
    local bannedGui = Instance.new("ScreenGui")
    bannedGui.Name = "AccountBannedGUI"
    bannedGui.IgnoreGuiInset = true
    bannedGui.ResetOnSpawn = false
    bannedGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    bannedGui.DisplayOrder = 999999
    bannedGui.Parent = game:GetService("CoreGui")

    -- Background
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.Position = UDim2.new(0, 0, 0, 0)
    bg.BackgroundColor3 = Color3.new(0, 0, 0)
    bg.BorderSizePixel = 0
    bg.ZIndex = 999999
    bg.Parent = bannedGui

    -- Text Label
    local text = Instance.new("TextLabel")
    text.Text = "ACCOUNT BANNED"
    text.Size = UDim2.new(0.8, 0, 0.2, 0)
    text.AnchorPoint = Vector2.new(0.5, 0.5)
    text.Position = UDim2.new(0.5, 0, 0.5, 0)
    text.BackgroundTransparency = 1
    text.TextColor3 = Color3.fromRGB(255, 0, 0)
    text.Font = Enum.Font.GothamBlack
    text.TextScaled = true
    text.ZIndex = 999999
    text.Parent = bg

    -- Floating/Shaking Animation
    task.spawn(function()
        local seed = 0
        while true do
            seed += 0.1
            local x = math.sin(seed * 3) * 5
            local y = math.cos(seed * 2.5) * 5
            text.Position = UDim2.new(0.5, x, 0.5, y)
            task.wait(0.03)
        end
    end)

    -- Kick Loop
    while true do
        task.wait(10)
        game.Players.LocalPlayer:Kick("Your account has been permanently banned.")
    end
end)
