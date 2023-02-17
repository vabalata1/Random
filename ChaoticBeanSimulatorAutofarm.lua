-- we love SkyTheFloof
-- szze#6220
repeat
	task.wait()
until game:IsLoaded()
local queueonteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
local httprequest = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request
local httpservice = game:GetService('HttpService')
local Players = game:GetService('Players')

--[[REQUIRED]]

local emergency = true
local emergencytext = 'patchwd'

if emergency == true then
   Players.LocalPlayer:Kick(emergencytext)
   return
end

--[[MAIN]]

local blacklistedids = {
	9779414,
	46045403
}

function shop()
	local gameId
	gameId = game.PlaceId
	local servers = {}
	local req = httprequest({
		Url = "https://games.roblox.com/v1/games/" .. gameId .. "/servers/Public?sortOrder=Desc&limit=100"
	})
	local body = httpservice:JSONDecode(req.Body)
	if body and body.data then
		for i, v in next, body.data do
			if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing > 4 then
				table.insert(servers, 1, v.id)
			end
		end
	end
	task.spawn(function()
		while task.wait(0.5) do
			if #servers > 0 then
				game:GetService("TeleportService"):TeleportToPlaceInstance(gameId, servers[math.random(1, #servers)], Players.LocalPlayer)
			end
		end
	end)
	game:GetService("TeleportService").TeleportInitFailed:Connect(function()
		game:GetService("TeleportService"):TeleportToPlaceInstance(gameId, servers[math.random(1, #servers)], Players.LocalPlayer)
	end)    
end

queueonteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/CF-Trail/random/main/ChaoticBeanSimulatorAutofarm.lua'))()")

for i, v in next, game:GetService('Players'):GetPlayers() do
	for _, id in next, blacklistedids do
		if v.UserId == id then
			Players.LocalPlayer:Kick('Serverhopping, blacklisted id [aka dev] joined')
			shop()
		end
	end
end

game:GetService('Players').PlayerAdded:Connect(function(v)
	for _, id in next, blacklistedids do
		if v.UserId == id then
			Players.LocalPlayer:Kick('Serverhopping, blacklisted id [aka dev] joined')
			shop()
		end
	end
end)

task.spawn(
    function()
	while task.wait() do
		game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OnLandFromJump"):FireServer(
                "\226\128\139"
            )
	end
end
)
while task.wait() do
	game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("Ascend"):InvokeServer()
	game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("Rebirth"):InvokeServer()
	for i, v in next, workspace:GetDescendants() do
		if v.Name == "GumdropHitbox" and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bean") then
			game:GetService("Players").LocalPlayer.Character.Bean.CFrame = CFrame.new(v.Position)
			task.wait(0.1)
			game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("InteractObject"):FireServer(v)
		end
	end
end
