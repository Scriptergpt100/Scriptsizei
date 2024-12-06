local players = game:GetService("Players")
local player = game.Players.LocalPlayer

-- Создаем GUI для админ панели
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Создаем фрейм
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 500)
frame.Position = UDim2.new(0.5, -150, 0.5, -250)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.Parent = screenGui
frame.Active = true
frame.Draggable = true  -- Делаем панель перетаскиваемой

-- Создаем текстовый заголовок
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Text = "АДМИН ПАНЕЛЬ"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 24
title.TextAlign = Enum.TextAlign.Center
title.BackgroundTransparency = 1
title.Parent = frame

-- Создаем кнопку для закрытия панели
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 10)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.TextSize = 20
closeButton.Parent = frame

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()  -- Закрываем панель
end)

-- Функция для поиска игрока по нику
local function getPlayerByName(name)
    for _, plr in pairs(players:GetPlayers()) do
        if plr.Name:lower() == name:lower() then
            return plr
        end
    end
    return nil
end

-- Кнопка для kill
local killButton = Instance.new("TextButton")
killButton.Size = UDim2.new(0, 250, 0, 40)
killButton.Position = UDim2.new(0.5, -125, 0, 70)
killButton.Text = "Kill"
killButton.TextColor3 = Color3.fromRGB(255, 0, 0)
killButton.TextSize = 20
killButton.Parent = frame
killButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

killButton.MouseButton1Click:Connect(function()
    local playerName = game:GetService("Players").LocalPlayer.Name -- Можешь заменить на любой метод для ввода имени
    local target = getPlayerByName(playerName)  -- Получаем цель по нику
    if target then
        target:LoadCharacter()  -- Убиваем игрока, перезагружая его персонажа
    end
end)

-- Кнопка для kick
local kickButton = Instance.new("TextButton")
kickButton.Size = UDim2.new(0, 250, 0, 40)
kickButton.Position = UDim2.new(0.5, -125, 0, 120)
kickButton.Text = "Kick"
kickButton.TextColor3 = Color3.fromRGB(255, 0, 0)
kickButton.TextSize = 20
kickButton.Parent = frame
kickButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

kickButton.MouseButton1Click:Connect(function()
    local playerName = game:GetService("Players").LocalPlayer.Name -- Можешь заменить на любой метод для ввода имени
    local target = getPlayerByName(playerName)  -- Получаем цель по нику
    if target then
        target:Kick("Вы были кикнуты администратором!")  -- Кикаем игрока
    end
end)

-- Кнопка для freeze
local freezeButton = Instance.new("TextButton")
freezeButton.Size = UDim2.new(0, 250, 0, 40)
freezeButton.Position = UDim2.new(0.5, -125, 0, 170)
freezeButton.Text = "Freeze"
freezeButton.TextColor3 = Color3.fromRGB(255, 0, 0)
freezeButton.TextSize = 20
freezeButton.Parent = frame
freezeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

freezeButton.MouseButton1Click:Connect(function()
    local playerName = game:GetService("Players").LocalPlayer.Name -- Можешь заменить на любой метод для ввода имени
    local target = getPlayerByName(playerName)  -- Получаем цель по нику
    if target then
        target.Character.HumanoidRootPart.Anchored = true  -- Замораживаем игрока
    end
end)

-- Кнопка для fly
local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0, 250, 0, 40)
flyButton.Position = UDim2.new(0.5, -125, 0, 220)
flyButton.Text = "Fly"
flyButton.TextColor3 = Color3.fromRGB(0, 255, 0)
flyButton.TextSize = 20
flyButton.Parent = frame
flyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

flyButton.MouseButton1Click:Connect(function()
    local playerName = game:GetService("Players").LocalPlayer.Name -- Можешь заменить на любой метод для ввода имени
    local target = getPlayerByName(playerName)  -- Получаем цель по нику
    if target then
        local humanoid = target.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.PlatformStand = true  -- Активируем режим полета
            humanoid:Move(Vector3.new(0, 10, 0))  -- Немного поднимаем игрока
        end
    end
end)

-- Кнопка для ban
local banButton = Instance.new("TextButton")
banButton.Size = UDim2.new(0, 250, 0, 40)
banButton.Position = UDim2.new(0.5, -125, 0, 270)
banButton.Text = "Ban"
banButton.TextColor3 = Color3.fromRGB(255, 0, 0)
banButton.TextSize = 20
banButton.Parent = frame
banButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

banButton.MouseButton1Click:Connect(function()
    local playerName = game:GetService("Players").LocalPlayer.Name -- Можешь заменить на любой метод для ввода имени
    local target = getPlayerByName(playerName)  -- Получаем цель по нику
    if target then
        -- Баним игрока (необходимо реализовать в зависимости от системы)
        -- Например, удаляем его в репозитории
        target:Kick("Вы были забанены администратором!")
    end
end)
