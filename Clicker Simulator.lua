local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()
local Window = redzlib:MakeWindow({
  Title = "Avalon Hub : Clicker Simulator",
  SubTitle = "by peerless",
  SaveFolder = "Avalon Hub | Clicker Simulator.lua"
})

local Discord = Window:MakeTab({"Discord", "Info"})
Discord:AddDiscordInvite({
  Name = "redz Hub | Community",
  Description = "Join our discord community to receive information about the next update",
  Logo = "rbxassetid://15298567397",
  Invite = "https://discord.gg/7aR7kNVt4g"
})

local MainFarm = Window:MakeTab({"Farm", "Home"})

 MainFarm:AddToggle({Name = "Auto Farm Clicker",Callback = function(Value)
    print("works")
  end})
