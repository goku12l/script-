local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()
local Window = redzlib:MakeWindow({
    Title = "AvalonHub [Clicker Simulator]", 
    SubTitle = "", 
    SaveFolder = "RedzConfig"
  })
  
  local Tab1 = Window:MakeTab({"Auto Farm", " you will be able to auto Farm"})

  local Toggle1 = Tab1:AddToggle({
    Name = "Auto Farm",
    Description = "Start Clicking for money",
    Default = false
  })
  
 
  
  Toggle1 = game:GetService("ReplicatedStorage").Remotes.Clicker:FireServer()

  
