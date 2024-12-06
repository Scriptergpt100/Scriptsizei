-- Создание пользовательского интерфейса
local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local robuxImage = Instance.new("ImageLabel")
local robuxInput = Instance.new("TextBox")
local playerInput = Instance.new("TextBox")
local startButton = Instance.new("TextButton")

-- Настройка интерфейса
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

frame.Size = UDim2.new(0, 400, 0, 200)
frame.Position = UDim2.new(0.5, -200, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame.Parent = screenGui

robuxImage.Size = UDim2.new(0, 30, 0, 30)
robuxImage.Position = UDim2.new(0, 10, 0.5, -15)
robuxImage.Image = "rbxassetid://1234567890"  -- Поменяй на ID изображения робукса
robuxImage.Parent = frame

robuxInput.Size = UDim2.new(0, 200, 0, 30)
robuxInput.Position = UDim2.new(0, 50, 0.5, -15)
robuxInput.PlaceholderText = "Введите фейковые робуксы"
robuxInput.Parent = frame

playerInput.Size = UDim2.new(0, 200, 0, 30)
playerInput.Position = UDim2.new(0, 50, 0.2, -15)
playerInput.PlaceholderText = "Введите ник игрока"
playerInput.Parent = frame

startButton.Size = UDim2.new(0, 100, 0, 40)
startButton.Position = UDim2.new(0, 150, 1, -50)
startButton.Text = "Старт"
startButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
startButton.Parent = frame

-- Логика для старта фейкового доната
startButton.TouchTap:Connect(function()
    local robuxAmount = tonumber(robuxInput.Text)
    local playerName = playerInput.Text
    
    if robuxAmount and playerName ~= "" then
        local player = game.Players:FindFirstChild(playerName)
        
        if player then
            -- Здесь можно добавить логику для отображения фейкового доната
            print(playerName .. " получил " .. robuxAmount .. " фейковых робуксов.")
            -- Можно сделать анимацию или сообщение, чтобы показать, что донат был выполнен
        else
            print("Игрок с таким ником не найден.")
        end
    else
        print("Пожалуйста, введите корректные данные.")
    end
end)
