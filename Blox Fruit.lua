local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))() -- Corrected the URL extension from ".Lua" to ".lua"
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
    AutoSea:AddToggle({
        Name = "Auto Trade Azure Ember",
        Callback = function(Value)
            getgenv().TradeAzureEmber = Value
            if Value then
                task.spawn(function()
                    local Modules = game:GetService("ReplicatedStorage"):WaitForChild("Modules", 9e9) -- Changed ReplicatedStorage to game:GetService("ReplicatedStorage")
                    local Net = Modules:WaitForChild("Net", 9e9)
                    local KitsuneRemote = Net:WaitForChild("RF/KitsuneStatuePray", 9e9)
                    
                    while getgenv().TradeAzureEmber do
                        task.wait(1)
                        KitsuneRemote:InvokeServer()
                    end
                end)
            end
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
