if game.PlaceId == 2753915549 then
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    
    -- Rayfield UI Script
    local window = Rayfield:CreateWindow({
        Name = "Bloxfruit Auto Farm",
        Parent = game.StarterGui.ScreenGui,
        Color = Color3.fromRGB(255, 255, 255),
    })
    
    local tab = window:CreateTab("Farm Settings")
    local section = tab:CreateSection("Settings")
    
    local toggle = section:CreateToggle({
        Name = "Auto Farm",
        CurrentValue = false,
        Callback = function(value)
            getgenv().autoFarm = value
        end,
    })
    
    local farmLocation = section:CreateInput({
        Name = "Farm Location",
        PlaceholderText = "X, Y, Z",
        CurrentValue = "0, 0, 0",
        Callback = function(value)
            getgenv().farmLocation = Vector3.new(tonumber(value:match("([^,]+),([^,]+),([^,]+)"))())
        end,
    })
    
    local farmRadius = section:CreateSlider({
        Name = "Farm Radius",
        Range = {0, 100},
        CurrentValue = 10,
        Callback = function(value)
            getgenv().farmRadius = value
        end,
    })
    
    local farmInterval = section:CreateSlider({
        Name = "Farm Interval",
        Range = {1, 60},
        CurrentValue = 5,
        Callback = function(value)
            getgenv().farmInterval = value
        end,
    })
    
    -- Bloxfruit Auto Farm Script
    getgenv().autoFarm = false
    getgenv().farmLocation = Vector3.new(0, 0, 0)
    getgenv().farmRadius = 10
    getgenv().farmInterval = 5
    
    spawn(function()
        while true do
            if getgenv().autoFarm then
                local player = game.Players.LocalPlayer
                local NPCs = game.Workspace:GetDescendants()
                
                for _, npc in pairs(NPCs) do
                    if npc.Name == "NPC" and npc.Humanoid.Health > 0 and (npc.HumanoidRootPart.Position - getgenv().farmLocation).Magnitude <= getgenv().farmRadius then
                        player.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
                        player.Character.Humanoid:TakeDamage(0) -- Trigger attack animation
                    end
                end
                
                -- Collect fruits
                for _, fruit in pairs(game.Workspace.Fruits:GetDescendants()) do
                    if (fruit.Position - getgenv().farmLocation).Magnitude <= getgenv().farmRadius then
                        player.Character.HumanoidRootPart.CFrame = fruit.CFrame
                        wait(0.1)
                    end
                end
            end
            
            wait(getgenv().farmInterval)
        end
    end)
end
