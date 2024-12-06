local players = game:GetService("Players")
local player = game.Players.LocalPlayer

-- Функция для поиска игрока по нику
local function getPlayerByName(name)
    for _, plr in pairs(players:GetPlayers()) do
        if plr.Name:lower() == name:lower() then
            return plr
        end
    end
    return nil
end

-- Функция для убийства игрока
local function killPlayer(target)
    if target then
        target:LoadCharacter()  -- Убиваем игрока, перезагружая его персонажа
    end
end

-- Создаем GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Кнопка для Kill
local killButton = Instance.new("TextButton")
killButton.Size = UDim2.new(0, 250, 0, 40)
killButton.Position = UDim2.new(0.5, -125, 0, 70)
killButton.Text = "Kill"
killButton.TextColor3 = Color3.fromRGB(255, 0, 0)
killButton.TextSize = 20
killButton.Parent = screenGui
killButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

-- Создаем поле для ввода ника
local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(0, 250, 0, 40)
searchBox.Position = UDim2.new(0.5, -125, 0, 120)
searchBox.PlaceholderText = "Введите ник"
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
searchBox.TextSize = 20
searchBox.Parent = screenGui

-- Обработчик касания на кнопку "Kill"
killButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then  -- Проверка на касание экрана
        local playerName = searchBox.Text  -- Получаем текст из поля ввода
        local target = getPlayerByName(playerName)  -- Получаем цель по нику
        if target then
            killPlayer(target)  -- Убиваем выбранного игрока
        else
            print("Игрок не найден!")
        end
    end
end)

-- Кнопка для Kill All
local killAllButton = Instance.new("TextButton")
killAllButton.Size = UDim2.new(0, 250, 0, 40)
killAllButton.Position = UDim2.new(0.5, -125, 0, 170)
killAllButton.Text = "Kill All"
killAllButton.TextColor3 = Color3.fromRGB(255, 0, 0)
killAllButton.TextSize = 20
killAllButton.Parent = screenGui
killAllButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

-- Обработчик касания на кнопку "Kill All"
killAllButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then  -- Проверка на касание экрана
        for _, target in pairs(players:GetPlayers()) do
            if target ~= player then  -- Не убиваем себя
                killPlayer(target)
            end
        end
    end
end)
