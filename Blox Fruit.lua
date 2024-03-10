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
  AutoSea:AddToggle({Name = "Auto Kitsune Island",Callback = function(Value)
    getgenv().AutoKitsuneIsland = Value;AutoKitsuneIsland()
  end})
  AutoSea:AddToggle({Name = "Auto Trade Azure Ember",Callback = function(Value)
    getgenv().TradeAzureEmber = Value
    task.spawn(function()
      local Modules = ReplicatedStorage:WaitForChild("Modules", 9e9)
      local Net = Modules:WaitForChild("Net", 9e9)
      local KitsuneRemote = Net:WaitForChild("RF/KitsuneStatuePray", 9e9)
      
      while getgenv().TradeAzureEmber do task.wait(1)
        KitsuneRemote:InvokeServer()
      end
    end)
  end})
  task.spawn(function()
    local Map = workspace:WaitForChild("Map", 9e9)
    task.spawn(function()
      while task.wait() do
        if Map:FindFirstChild("KitsuneIsland") then
          local plrPP = Player.Character and Player.Character.PrimaryPart
          if plrPP then
            Distance = tostring(math.floor((plrPP.Position - Map.KitsuneIsland.WorldPivot.p).Magnitude / 3))
          end
        end
      end
    end)
    
    while task.wait() do
      if Map:FindFirstChild("KitsuneIsland") then
        KILabel:SetTitle("Kitsune Island : Spawned | Distance : " .. Distance)
      else
        KILabel:SetTitle("Kitsune Island : not Spawn")
      end
    end
  end)
  AutoSea:AddSection({"Sea"})
  AutoSea:AddToggle({Name = "Auto Farm Sea",Callback = function(Value)
    getgenv().AutoFarmSea = Value;AutoFarmSea()
  end})
  AutoSea:AddButton({Name = "Buy New Boat",Callback = function()
    BuyNewBoat()
  end})
  AutoSea:AddSection({"Material"})
  AutoSea:AddToggle({"Auto Wood Planks", false, function(Value)
    getgenv().AutoWoodPlanks = Value
    task.spawn(function()
      local Map = workspace:WaitForChild("Map", 9e9)
      local BoatCastle = Map:WaitForChild("Boat Castle", 9e9)
      
      local function TreeModel()
        for _,Model in pairs(BoatCastle["IslandModel"]:GetChildren()) do
          if Model.Name == "Model" and Model:FindFirstChild("Tree") then
            return Model
          end
        end
      end
      
      local function GetTree()
        local Tree = TreeModel()
        if Tree then
          local Nearest = math.huge
          local selected
          for _,tree in pairs(Tree:GetChildren()) do
            local plrPP = Player.Character and Player.Character.PrimaryPart
            if tree and tree.PrimaryPart and tree.PrimaryPart.Anchored then
              if plrPP and (plrPP.Position - tree.PrimaryPart.Position).Magnitude < Nearest then
                Nearest = (plrPP.Position - tree.PrimaryPart.Position).Magnitude
                selected = tree
              end
            end
          end
          return selected
        end
      end
