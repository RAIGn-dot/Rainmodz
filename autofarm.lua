-- Quest Data Table
local QuestsData = {
    Bandit = {
        Enemy = "Bandit [Lv. 5]",
        QuestName = "BanditQuest1",
        EnemyName = "Bandit",
        LevelQuest = 1,
        CFramePos = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544),
        QuestGiver = "Bandit Quest Giver",
        World = 1
    },
    Monkey = {
        Enemy = "Monkey [Lv. 14]",
        QuestName = "JungleQuest",
        EnemyName = "Monkey",
        LevelQuest = 1,
        CFramePos = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0),
        QuestGiver = "Adventurer",
        World = 1
    },
    Gorilla = {
        Enemy = "Gorilla [Lv. 20]",
        QuestName = "JungleQuest",
        EnemyName = "Gorilla",
        LevelQuest = 2,
        CFramePos = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0),
        QuestGiver = "Adventurer",
        World = 1
    },
    Pirate = {
        Enemy = "Pirate [Lv. 35]",
        QuestName = "BuggyQuest1",
        EnemyName = "Pirate",
        LevelQuest = 1,
        CFramePos = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627),
        QuestGiver = "Pirate Adventurer",
        World = 1
    },
    Brute = {
        Enemy = "Brute [Lv. 45]",
        QuestName = "BuggyQuest1",
        EnemyName = "Brute",
        LevelQuest = 2,
        CFramePos = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627),
        QuestGiver = "Pirate Adventurer",
        World = 1
    },
    -- Continue adding other quests here...

    Galley_Pirate = {
        Enemy = "Galley Pirate [Lv. 625]",
        QuestName = "FountainQuest",
        EnemyName = "Galley Pirate",
        LevelQuest = 1,
        CFramePos = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381),
        QuestGiver = "Freezeburg Quest Giver",
        World = 1
    },
    Galley_Captain = {
        Enemy = "Galley Captain [Lv. 650]",
        QuestName = "FountainQuest",
        EnemyName = "Galley Captain",
        LevelQuest = 2,
        CFramePos = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381),
        QuestGiver = "Freezeburg Quest Giver",
        World = 1
    }
}

-- Function to load a quest
function loadQuest(questName)
    local quest = QuestsData[questName]
    if quest then
        print("Quest Name: " .. quest.QuestName)
        print("Enemy: " .. quest.Enemy)
        print("Location: " .. tostring(quest.CFramePos))
        print("Quest Giver: " .. quest.QuestGiver)
        -- Add code to teleport player to quest location
        -- Add code to activate quest giver interactions
    else
        print("Quest not found: " .. questName)
    end
end

-- Example usage
loadQuest("Bandit") -- To load the "Bandit" quest
loadQuest("Monkey")  -- To load the "Monkey" quest
