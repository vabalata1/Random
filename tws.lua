local plr = game:service("Players").LocalPlayer
function Time(targetpos)
    local tme = (targetpos - plr.Character.HumanoidRootPart.Position).Magnitude / plr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed
    return tme
end

for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
    v:Disable()
end

function CreateTween(inst, props, dur, es, ed, ...)
    game:GetService("TweenService"):Create(inst, TweenInfo.new(dur, Enum.EasingStyle[es], Enum.EasingDirection[ed], ...), props):Play()
end

for a,b in next, workspace:GetDescendants() do
    if b:IsA('Seat') then b:Destroy() end
end

getgenv().enabled2 = true

local boxes = game:GetService("Workspace").MainPlace.DELIVERtm.Start -- great job patching!
local players = game:GetService('Players')

while wait(25.5) and getgenv().enabled2 do
    CreateTween(players.LocalPlayer.Character.HumanoidRootPart, {CFrame = boxes.CFrame * CFrame.new(0, 2, 0)}, Time(boxes.Position) + math.random(0,3), "Linear", "In")
    wait(21)
    fireclickdetector(boxes.ClickDetector)
    wait(.5)
    for a,b in next, players.LocalPlayer.Backpack:GetChildren() do
        if string.match(string.lower(b.Name), "box") then
            b.Parent = players.LocalPlayer.Character
        end
    end
    CreateTween(players.LocalPlayer.Character.HumanoidRootPart, {CFrame = boxes.Parent.DeliverBar.CFrame * CFrame.new(0, -1, 0)}, Time(boxes.Parent.DeliverBar.Position) + math.random(0,3), "Linear", "In")
end
