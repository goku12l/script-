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
  
  Toggle1:SetValue(true) -- Assuming this function sets the toggle to true or false

    -- Assuming the FireServer part needs to be wrapped in a function or a conditional
    if Toggle1.Value then
        game:GetService("ReplicatedStorage").Remotes.Clicker:FireServer()
    end
