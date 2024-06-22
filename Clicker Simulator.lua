local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()
local Window = redzlib:MakeWindow({
    Title = "AvalonHub [Clicker Simulator]", 
    SubTitle = "", 
    SaveFolder = "RedzConfig"
})

local Tab1 = Window:MakeTab({"Auto Farm", " you will be able to auto Farm"})

local AutoFarmToggle = Tab1:AddToggle({
    Name = "Auto Farm",
    Description = "Start Clicking for money",
    Default = false
})

-- Function to start auto-farming
local function StartAutoFarm()
    print("Auto Farm Started")
    while AutoFarmToggle.Value do
        game:GetService("ReplicatedStorage").Remotes.Clicker:FireServer()
        print("Clicked for money")
        wait(0.1) -- Adjust the wait time as needed
    end
    print("Auto Farm Stopped")
end

-- Listen for changes in the toggle value
AutoFarmToggle.OnChanged = function(value)
    print("Toggle changed: ", value)
    if value then
        StartAutoFarm()
    end
end

-- Initial check if the toggle is on by default
if AutoFarmToggle.Value then
    StartAutoFarm()
end
