-- Команды для админа
local adminCommands = {
    -- Команда для кика
    kick = function(playerName)
        local player = game.Players:FindFirstChild(playerName)
        if player then
            player:Kick("Вы были кикнуты администратором.")
            print(playerName .. " был кикнут.")
        else
            print("Игрок не найден.")
        end
    end,

    -- Команда для бана
    ban = function(playerName, reason)
        local player = game.Players:FindFirstChild(playerName)
        if player then
            player:Kick("Забанен: " .. reason)
            -- Здесь можно добавить код для постоянного бана
            print(playerName .. " был забанен. Причина: " .. reason)
        else
            print("Игрок не найден.")
        end
    end,

    -- Команда для полета
    fly = function(playerName)
        local player = game.Players:FindFirstChild(playerName)
        if player then
            local character = player.Character
            if character then
                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.PlatformStand = true  -- Отключение физики для полета
                    local bodyGyro = Instance.new("BodyGyro")
                    bodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)
                    bodyGyro.CFrame = character.HumanoidRootPart.CFrame
                    bodyGyro.Parent = character.HumanoidRootPart

                    local bodyVelocity = Instance.new("BodyVelocity")
                    bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
                    bodyVelocity.Velocity = Vector3.new(0, 50, 0)  -- Подъем вверх
                    bodyVelocity.Parent = character.HumanoidRootPart
                    print(playerName .. " теперь может летать.")
                end
            end
        else
            print("Игрок не найден.")
        end
    end,

    -- Проверка прав администратора
    isAdmin = function(playerName)
        return playerName == "Cheater100651"  -- Тут указываем свой ник
    end
}

-- Пример использования команд
-- adminCommands.kick("Игрок1")
-- adminCommands.ban("Игрок2", "Нарушение правил")
-- adminCommands.fly("Игрок3")
