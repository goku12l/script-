local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()
local Window = redzlib:MakeWindow({
    Title = "Avalon Hub : Blox Fruits",
    SubTitle = "by Peerlessgod",
    SaveFolder = "Avalon Hub | Blox Fruits.lua"
})

local AFKOptions = {}

local Discord = Window:MakeTab({"Discord", "Info"})
Discord:AddDiscordInvite({
    Name = "Avalon Hub | Community",
    Description = "Join our discord community to receive information about the next update",
    Logo = "rbxassetid://15799458477",
    Invite = "https://discord.gg/2apFTuuzGS"
})

local MainFarm = Window:MakeTab({"Farm", "Home"})

if Sea3 then
    local AutoSea = Window:MakeTab({"Sea", "Waves"})
    AutoSea:AddSection({"Kitsune"})
    local KILabel = AutoSea:AddParagraph({"Kitsune Island : not spawn"})
    AutoSea:AddToggle({
        Name = "Auto Kitsune Island",
        Callback = function(Value)
            getgenv().AutoKitsuneIsland = Value
            AutoKitsuneIsland()
        end
    })
end

local Informacoes = Window:MakeTab({"Info", "Search"})
Informacoes:AddSection({"Player"})
local Nerd = Informacoes:AddParagraph({"Nerd < Accessories Info >"})
task.spawn(function()
    while task.wait() do
        Nerd:SetDesc(FireRemote("Nerd"))
    end
end)
