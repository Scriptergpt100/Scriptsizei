-- Конфигурация
local targetPlayerName = "Cheater100651" -- Ваш ник

-- Функция для увеличения размера персонажа и настройки головы
local function resizeCharacter(character)
    local humanoid = character:FindFirstChild("Humanoid")
    local head = character:FindFirstChild("Head")
    local rootPart = character:FindFirstChild("HumanoidRootPart")

    if humanoid and head and rootPart then
        -- Изменяем размеры персонажа
        humanoid.BodyDepthScale.Value = 20 -- Ширина персонажа
        humanoid.BodyHeightScale.Value = 20 -- Высота персонажа
        humanoid.BodyWidthScale.Value = 20 -- Глубина персонажа
        humanoid.HeadScale.Value = 20 -- Размер головы персонажа

        -- Корректируем положение головы
        head.CFrame = rootPart.CFrame * CFrame.new(0, 10, 0) -- Смещаем голову выше
    end
end

-- Ждём игрока с указанным ником
local player = game.Players:FindFirstChild(targetPlayerName)

if player then
    local character = player.Character or player.CharacterAdded:Wait()
    resizeCharacter(character)

    -- Если персонаж обновляется (например, после возрождения)
    player.CharacterAdded:Connect(function(newCharacter)
        resizeCharacter(newCharacter)
    end)
else
    warn("Игрок с ником " .. targetPlayerName .. " не найден!")
end
