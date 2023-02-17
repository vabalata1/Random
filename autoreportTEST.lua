repeat task.wait() until game:IsLoaded()
reportedfolder = Instance.new('Folder',game.CoreGui)
reportedfolder.Name = 'reportedPeople'

words = {
    ['gay'] = 'Bullying',
    ['lesbian'] = 'Bullying',
    ['retard'] = 'Bullying',
    ['noob'] = 'Bullying',
    ['clown'] = 'Bullying',
    ['get a life'] = 'Bullying',
    ['getalife'] = 'Bullying',
    ['no life'] = 'Bullying',
    ['nolife'] = 'Bullying',
    ['wizard'] = 'Bullying',
    ['reports'] = 'Bullying',
    ['father'] = 'Bullying',
    ['mother'] = 'Bullying',
    ['dumb'] = 'Bullying',
    ['stupid'] = 'Bullying',
    ['lgbt'] = 'Bullying',
    ['death to'] = 'Bullying',
    ['creep'] = 'Bullying',
    ['overweight'] = 'Bullying',
    ['trans'] = 'Bullying',
    ['cringe'] = 'Bullying',
    ['skill issue'] = 'Bullying',
    ['parent'] = 'Bullying',
    ['kid'] = 'Bullying',
    ['ugly'] = 'Bullying',
    ['child'] = 'Bullying',
    ['trash'] = 'Bullying',
    ['gender'] = 'Bullying',
    ['bozo'] = 'Bullying',
    ['kys'] = 'Bullying',
    ['die'] = 'Bullying',
    ['killyou'] = 'Bullying',
    ['suck'] = 'Bullying',
    ['loser'] = 'Bullying',
    ['black'] = 'Bullying',
    [' white '] = 'Bullying',
    ['weirdo'] = 'Bullying',
    ['g@y'] = 'Bullying',
    ['havker'] = 'Bullying',
    ['hecker'] = 'Bullying',
    ['cry'] = 'Bullying',
    ['ez l'] = 'Bullying',
    ['shut'] = 'Bullying',
    ['l ez'] = 'Bullying',
    ['negro'] = 'Bullying',
    ['nivver'] = 'Bullying',
    ['negar'] = 'Bullying',
    --['bad'] = 'Bullying',
    ['worst'] = 'Bullying',
    ['goofy'] = 'Bullying',
    ['monkey'] = 'Bullying',
    ['nerd'] = 'Bullying',
    ['fat'] = 'Bullying',
    ['hack'] = 'Scamming',
    ['exploit'] = 'Scamming',
    ['cheat'] = 'Scamming',
    ['download'] = 'Offsite Links',
    ['youtube'] = 'Offsite Links',
    ['dizzy'] = 'Offsite Links',
    ['disco'] = 'Offsite Links',
}

if not game:GetService('ReplicatedStorage'):FindFirstChild('DefaultChatSystemChatEvents') or not game:GetService('ReplicatedStorage'):FindFirstChild('DefaultChatSystemChatEvents'):FindFirstChild('OnMessageDoneFiltering') then return end
DCSCE = game:GetService('ReplicatedStorage'):FindFirstChild('DefaultChatSystemChatEvents')
msg = DCSCE:FindFirstChild('OnMessageDoneFiltering')

if setfflag then
	setfflag("AbuseReportScreenshotPercentage", 0)
	setfflag("DFFlagAbuseReportScreenshot", "False") 
end

if not autoreportcfg then
getgenv().autoreportcfg = {
    Webhook = '', 
    Blatant = false,
    autoMessage = {
       enabled = true,
       Message = 'so sad you got autoreported :(',
    },
}
end

local players = game:GetService("Players")
local notifs = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

function notify(title, text)
    notifs:MakeNotification({
        Name = title,
        Content = text,
        Time = 7
    });
end;


if syn then
   notify("Autoreport",'this DOESNT WORK ON SYNAPSE!')
   notify('Autoreport','3ds disabled ReportAbuse so yea')
   return
end

function handler(msg,speaker)
   for i,v in next, words do
      if string.match(string.lower(msg),i) and not reportedfolder:FindFirstChild(speaker) then
        if (autoreportcfg.Blatant and autoreportcfg.Blatant == true) then
            for i = 0,9 do
                players:ReportAbuse(players[speaker],v,'He is breaking roblox TOS')
                task.wait(0.2)
            end
        else
            players:ReportAbuse(players[speaker],'Text Chat',v,'He is breaking roblox TOS')
         task.wait(1.5)
         players:ReportAbuse(players[speaker],'Text Chat',v,'He is breaking roblox TOS')
        end
         if autoreportcfg.Webhook ~= nil and autoreportcfg.Webhook ~= '' and autoreportcfg.Webhook ~= ' ' then
         local data = 
         {
             ["embeds"] = {{
                 ["title"] = "**" .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name .. "**",
                 ["description"] = "Auto-reported a player",
                 ["type"] = "rich",
                 ["color"] = tonumber(0x00aff4),
                 ["url"] = "https://www.roblox.com/games/" .. game.PlaceId,
                 ["fields"] = {
                     {
                         ["name"] = "Name",
                         ["value"] = "[" .. players[speaker].Name .. "](https://www.roblox.com/users/" .. players[speaker].UserId .. ")",
                         ["inline"] = true
                     },
                     {
                         ["name"] = "Message",
                         ["value"] = msg,
                         ["inline"] = true
                     },
                     {
                        ["name"] = "Offensive Part",
                        ["value"] = i,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Reported For",
                        ["value"] = v,
                        ["inline"] = true
                    },
                 },
                 ["footer"] = {
                     ["text"] = "\nIf you think this is a mistake: stfu"
                 },
                 ["author"] = {
                     ["name"] = "Auto Report"
                 }
             }}
         }
     local newdata = (game:GetService("HttpService")):JSONEncode(data);
     local request = http_request or request or HttpPost or http.request or syn.request;
     local abcdef = {
         Url = autoreportcfg.Webhook,
         Body = newdata,
         Method = "POST",
         Headers = {
             ["content-type"] = "application/json"
         }
     };
     request(abcdef);
    else
        notify('Autoreport','Autoreported ' .. speaker .. ' | offensive part: ' .. i)
    end
    if DCSCE:FindFirstChild('SayMessageRequest') and autoreportcfg.autoMessage.enabled == true then
       DCSCE.SayMessageRequest:FireServer('/w ' .. speaker .. ' ' .. autoreportcfg.autoMessage.Message,'All')
    end
    erwt = Instance.new('StringValue',reportedfolder)
    erwt.Name = speaker
      end
   end
end

msg.OnClientEvent:Connect(function(msgdata)
    if tostring(msgdata.FromSpeaker) ~= players.LocalPlayer.Name then
       handler(tostring(msgdata.Message),tostring(msgdata.FromSpeaker))
    end
end)
