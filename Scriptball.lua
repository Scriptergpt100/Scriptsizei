local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Бессмертие
character:WaitForChild("Humanoid").HealthChanged:Connect(function()
    character:WaitForChild("Humanoid").Health = character:WaitForChild("Humanoid").MaxHealth
end)

-- Остановка мяча рядом с игроком
local ball = workspace:WaitForChild("TrainingBalls")  -- Используем TrainingBalls вместо Ball
local distanceThreshold = 10  -- Расстояние, на котором мяч будет останавливаться
local isNearBall = false
local stopBall = false

-- Проверка расстояния между игроком и мячом
game:GetService("RunService").Heartbeat:Connect(function()
    if ball and character then
        local distance = (ball.Position - character.HumanoidRootPart.Position).Magnitude
        if distance < distanceThreshold then
            isNearBall = true
        else
            isNearBall = false
        end
    end
end)

-- Остановка мяча, если он близко
game:GetService("RunService").Heartbeat:Connect(function()
    if isNearBall and not stopBall then
        ball.Velocity = Vector3.new(0, 0, 0)  -- Останавливаем мяч
        stopBall = true
    elseif not isNearBall then
        stopBall = false
    end
end)

-- Лезвие, которое можно активировать
local bladeCooldown = 5  -- Время на активацию лезвия в секундах
local bladeReady = true
local bladeAttack = Instance.new("Tool")
bladeAttack.Name = "Blade"
bladeAttack.RequiresHandle = true
bladeAttack.Parent = player.Backpack

local function activateBlade()
    if bladeReady then
        bladeReady = false
        print("Лезвие активировано!")
        -- Добавьте сюда логику для атаки лезвием в соответствии с игрой
        wait(bladeCooldown)  -- Ожидание перезарядки
        bladeReady = true
    end
end

-- Проверка нажатия кнопки для активации лезвия
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        activateBlade()  -- Активация лезвия по клику мышью
    end
end)

-- Автоматическая атака мяча через 5 минут, если не активировать лезвие
local attackTimer = 300  -- 5 минут
local lastActionTime = tick()

game:GetService("RunService").Heartbeat:Connect(function()
    if tick() - lastActionTime >= attackTimer then
        print("Мяч ударит сам!")
        -- Логика удара мяча
        -- Пример: можно сделать мяч атакующим объектом, который будет двигаться к игроку
        -- Добавьте логику для удара мяча
        lastActionTime = tick()  -- Сбрасываем таймер
    end
end)
