local Meteor = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Bloxburg = Meteor:CreateWindow({
    Name = "RAINMODZ Lite : Bloxfruit",
    LoadingTitle = "RAINMODZ Lite",
    LoadingSubtitle = "by RAINMODZ",
    ConfigurationSaving = { Enabled = true, FolderName = "MeteorLite", FileName = "Bloxburg" }
})

local Autofarm = Bloxburg:CreateTab("Autofarm")

local SelectedQuest = {Quest = "", Enabled = false, AutoSelect = false, FirstSea = "", SecondSea = ""}

table.insert(QuestData.FirstSea, "First Sea")
table.insert(QuestData.SecondSea, "Second Sea")
table.insert(QuestData.ThirdSea, "Third Sea")

FirstSeaD = Autofarm:CreateDropdown({
    Name = "Quest : FirstSea",
    Options = QuestData.FirstSea,
    Flag = "Dropdown1",
    CurrentOption = "First Sea",
    Callback = function(Option)
        SelectedQuest.Quest = Option
    end,
})

local SecondSeaD = Autofarm:CreateDropdown({
    Name = "Quest : SecondSea",
    Options = QuestData.SecondSea,
    Flag = "Dropdown2",
    CurrentOption = "Second Sea",
    Callback = function(Option)
        SelectedQuest.Quest = Option
    end,
})

local ThirdSeaD = Autofarm:CreateDropdown({
    Name = "Quest : ThirdSea",
    Options = QuestData.ThirdSea,
    Flag = "Dropdown3",
    CurrentOption = "Third Sea",
    Callback = function(Option)
        SelectedQuest.Quest = Option
    end,
})


Autofarm:CreateToggle({ Name = "Auto Select", CurrentValue = false, Flag = "Toggle2",
    Callback = function(Value)
        SelectedQuest.AutoSelect = Value
        
        while task.wait() do
            if not SelectedQuest.AutoSelect then break end

            SelectedEnemy = QuestData.CalculateLevel(tonumber(game.Players.LocalPlayer.PlayerGui.Main.Level.Text:sub(5)))

            for i,v in pairs(QuestData.Quests) do
                if v.EnemyName == SelectedEnemy then
                    if v.World == 1 and World == 1 then
                        FirstSeaD:Set(v.EnemyName)
                    elseif v.World == 2 and World == 2 then
                        SecondSeaD:Set(v.EnemyName)
                    elseif v.World == 3 and World == 3 then
                        ThirdSeaD:Set(v.EnemyName)
                    end
                end
            end
            
        end
    end
})

Autofarm:CreateSection("Quest Autofarm")

Autofarm:CreateToggle({ Name = "Quest Autofarm", CurrentValue = false, Flag = "Toggle1",
    Callback = function(Value)
        SelectedQuest.Enabled = Value

        while task.wait() do
            if not SelectedQuest.Enabled then break end

            Attack(SelectedQuest.Quest)
        end
    end
})
