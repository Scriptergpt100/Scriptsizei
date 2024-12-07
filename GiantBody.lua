local targetPlayerName = "cheater100651" -- Имя игрока с маленькой буквы

local function resizeCharacter(character)
    local humanoid = character:FindFirstChild("Humanoid")
    local head = character:FindFirstChild("Head")
    local rootPart = character:FindFirstChild("HumanoidRootPart")

    if humanoid and head and rootPart then
        -- Изменяем размеры всего тела, делая его гигантским
        humanoid.BodyDepthScale.Value = 100 -- Увеличиваем глубину тела
        humanoid.BodyHeightScale.Value = 100 -- Увеличиваем высоту тела
        humanoid.BodyWidthScale.Value = 100 -- Увеличиваем ширину тела
        humanoid.HeadScale.Value = 100 -- Увеличиваем размер головы

        -- Корректируем положение головы, чтобы она оставалась на правильном месте
        head.CFrame = rootPart.CFrame * CFrame.new(0, 50, 0) -- Смещаем голову вверх на 50 единиц
    end
end

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
