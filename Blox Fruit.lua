local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.lua"))()
local Window = redzlib:MakeWindow({
    Title = "Avalon Hub : Blox Fruits",
    SubTitle = "by Peerlessgod",
    SaveFolder = "Avalon Hub | Blox Fruits.lua"
})

local AFKOptions = {}

local Discord = Window:MakeTab("Discord", "Info") -- You don't need to pass an array to MakeTab
Discord:AddDiscordInvite({
    Name = "Avalon Hub | Community",
    Description = "Join our discord community to receive information about the next update",
    Logo = "rbxassetid://15799458477",
    Invite = "https://discord.gg/2apFTuuzGS"
})
