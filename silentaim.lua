local hotkey = "t" 
local mouse = game.Players.LocalPlayer:GetMouse()



mouse.KeyDown:Connect(function(key)
if key == hotkey then
if getgenv().ValiantAimHacks.SilentAimEnabled == true then
 getgenv().ValiantAimHacks.SilentAimEnabled = false
else
getgenv().ValiantAimHacks.SilentAimEnabled = true
end
end
end)



local Players = game:GetService("Players")


local LocalPlayer = Players.LocalPlayer
local accomidationfactor = 0.162231

local SilentAim = loadstring(game:HttpGet("https://pastebin.com/raw/2f0mGbMP%22))()
SilentAim.TeamCheck = false

local mt = getrawmetatable(game)
local backupindex = mt.index
setreadonly(mt, false)


SilentAim.checkSilentAim = function()
    local checkA = (SilentAim.SilentAimEnabled == true and SilentAim.Selected ~= LocalPlayer)
    local playerCharacter = SilentAim.Selected.Character
    local daHood = (playerCharacter.BodyEffects["K.O"].Value == false or playerCharacter:FindFirstChild("GRABBING_CONSTRAINT") ~= nil)

    return (checkA and daHood)
end


mt.index = newcclosure(function(t, k)
    if (t:IsA("Mouse") and (k == "Hit")) then
        print(t, k)
        local CPlayer = SilentAim.Selected
        if (SilentAim.checkSilentAim()) then
            if (CPlayer.Character:FindFirstChild("UpperTorso")) then
                return {p=(CPlayer.Character.UpperTorso.CFrame.p+(CPlayer.Character.UpperTorso.Velocity*accomidationfactor))}
            end
        end
    end
    return backupindex(t, k)
end)


setreadonly(mt, true)
getgenv().ValiantAimHacks.FOV = 27