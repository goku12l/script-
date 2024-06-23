local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

-- Create the window
local Window = redzlib:MakeWindow({
  Title = "Avalon Hub : Clicker Simulator",
  SubTitle = "by peerless",
  SaveFolder = "Avalon Hub | Clicker Simulator.lua"
})
  

-- Create the Discord tab
local Discord = Window:MakeTab({"Discord", "Info"})
Discord:AddDiscordInvite({
  Name = "Avalon Hub | Community",
  Description = "Join our discord community to receive information about the next update",
  Logo = "rbxassetid://15298567397",
  Invite = "https://discord.gg/2apFTuuzGS"
})




  -- Create the MainFarm tab
local MainFarm = Window:MakeTab({"Farm", "Home"})

-- Initialize the auto farmer state
getgenv().farmer = false

MainFarm:AddToggle({
  Name = "Auto Farm Clicker",
  Callback = function(Value)
    getgenv().farmer = Value
    if Value then
      -- Start auto farming
      spawn(function()
        while getgenv().farmer do
          game:GetService("ReplicatedStorage").Remotes.Clicker:FireServer()
          wait()
        end
      end)
    end
  end
})
--[[
"Button Name" = <string> - The name of the button.
function() = <function> - The function to execute when the button is pressed.
]]

  
MainFarm:AddToggle({
  Name = "Auto Rebirth",
  Callback = function(Value)
    getgenv().rebirther = Value
    if Value then
      -- Start auto rebirthing
      spawn(function()
        while getgenv().rebirther do
          game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer()
          wait(1) -- Adjust the wait time as needed
        end
      end)
    end
  end
})

MainFarm:AddToggle({
  Name = "Auto Area",
  Callback = function(Value)
    getgenv().areafarmer = Value
    if Value then
      -- Start auto area farming
      spawn(function()
        while getgenv().areafarmer do
          game:GetService("ReplicatedStorage").Remotes.Area:FireServer()
          wait(1) -- Adjust the wait time as needed
        end
      end)
    end
  end
})

MainFarm:AddToggle({
  Name = "Auto Equip Pets",
  Callback = function(Value)
    getgenv().petequipper = Value
    if Value then
      -- Start auto pet equipping
      spawn(function()
        while getgenv().petequipper do
          local args = {
            [1] = "Equip",
            [2] = {}
          }
          game:GetService("ReplicatedStorage").Remotes.Pet:FireServer(unpack(args))
          wait(1) -- Adjust the wait time as needed
        end
      end)
    end
  end
})

local MainFarm = Window:MakeTab({"Settings", "settings"})
