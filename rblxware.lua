local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()
local win = DiscordLib:Window("i am oneshot stan / .gg")
local serv = win:Server("RBLXWare", "")
local main = serv:Channel("Main")
local btns = serv:Channel("Bypasses")
local hack = serv:Channel("Gamepasses")
local opti = serv:Channel("Optimization")


btns:Button("Get developer things [will kick if u do anything in console]", function()
    game:GetService("Players").LocalPlayer.PlayerStatus.Owner.Value = true
end)


main:Button("Bypass no jumping rounds [can jump in them]", function()
while wait() do
game.Players.LocalPlayer.Character.Humanoid.JumpPower = 55
end
end)

main:Button("Reset [works in explosions]",function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

main:Button("Infinite Jump / UNinf jump",function()
    if game:GetService("ReplicatedStorage").Minigames.InfiniteJump.Value == true then
        game:GetService("ReplicatedStorage").Minigames.InfiniteJump.Value = false
    else
        game:GetService("ReplicatedStorage").Minigames.InfiniteJump.Value = true
    end
end)

btns:Textbox("Taunt to play [reset, press G and 1 - 3] [FE]", "bthg.fandom.com/wiki/Taunts (type without whitespaces, some doesn't work)", true, function(t)
    if game:GetService("Players").LocalPlayer.Equipped.Taunt.Taunt1.Value == "None" then
        game:GetService("Players").LocalPlayer.Equipped.Taunt.Taunt1.Value = tostring(t)
    elseif game:GetService("Players").LocalPlayer.Equipped.Taunt.Taunt2.Value == "None" then
        game:GetService("Players").LocalPlayer.Equipped.Taunt.Taunt2.Value = tostring(t)
    elseif game:GetService("Players").LocalPlayer.Equipped.Taunt.Taunt3.Value == "None" then
        game:GetService("Players").LocalPlayer.Equipped.Taunt.Taunt3.Value = tostring(t)
    elseif game:GetService("Players").LocalPlayer.Equipped.Taunt.Taunt1.Value ~= "None" and game:GetService("Players").LocalPlayer.Equipped.Taunt.Taunt2.Value ~= "None" and game:GetService("Players").LocalPlayer.Equipped.Taunt.Taunt3.Value ~= "None" then
        game:GetService("Players").LocalPlayer.Equipped.Taunt.Taunt1.Value = tostring(t)
    end
end)

btns:Textbox("Taunt effect bypass [FE]", "bthg.fandom.com", true, function(effect)
local args = {
    [1] = game:GetService("Players").LocalPlayer.Character,
    [2] = tostring(effect)
}

game:GetService("ReplicatedStorage").Remotes.Animations.TauntEffect:FireServer(unpack(args))
end)
btns:Textbox("Gun bypass [Clientsided!]", "bthg.fandom.com try with and without whitespaces", true, function(gun)
     local gun1 = game.ReplicatedStorage.Tools:FindFirstChild(tostring(gun))
     local gun2 = gun1:Clone()
     gun2.Parent = game:GetService("Players").LocalPlayer.Backpack
end)


btns:Textbox("FOV bypass [reset after]", "number", true, function(fov)

game:GetService("Players").LocalPlayer.PlayerSettings.FOV.Value = tonumber(fov)
end)

btns:Textbox("ANY streak [Clientsided!]", "number", true, function(streak)
    game:GetService("Players").LocalPlayer.PlayerStatus.Streak.Value = tonumber(streak)
    game.Players.LocalPlayer.Character.Head.Streak.TextLabel.Text = "Streak: " .. tonumber(streak)
end)

main:Button("Reset blur (for blur round)", function()
    game:GetService("Players").LocalPlayer.PlayerStatus.BlurLevel.Value = 0
    game:GetService("Players").LocalPlayer.Backpack.Blur:Destroy()
    game:GetService("StarterPack").Blur:Destroy()
    game:GetService("Lighting").Blur.Enabled = false
    
end)

opti:Button("Boost FPS", function()
    game:GetService("Players").LocalPlayer.PlayerSettings.BloomEnabled.Value = false
    game:GetService("Players").LocalPlayer.PlayerSettings.SunRaysEnabled.Value = false
    game:GetService("Players").LocalPlayer.PlayerSettings.ParticlesEnabled.Value = false
end)

opti:Button("Reset to default", function()
    game:GetService("Players").LocalPlayer.PlayerSettings.BloomEnabled.Value = true
    game:GetService("Players").LocalPlayer.PlayerSettings.SunRaysEnabled.Value = true
    game:GetService("Players").LocalPlayer.PlayerSettings.ParticlesEnabled.Value = true
end)

main:Button("Show all hidden things in the shop", function()
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Shop.Shop.Items:GetDescendants()) do
       if v:IsA("ImageButton") then
        v.Visible = true
       end
    end
    for i,v in pairs(game:GetService("Players").LocalPlayer.Items:GetDescendants()) do
        if v:IsA("BoolValue") then
            v.Value = true
        end
    end
end)

hack:Button("Get extra taunt slots", function()
    game:GetService("Players").LocalPlayer.PlayerStatus.ExtraTaunts.Value = true
end)
