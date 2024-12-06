local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Ищем способность Guardian Angel
local guardianAngelActive = true  -- Сразу активируем способность
local guardianAngelMaxUses = 1000000  -- Устанавливаем максимальное количество использований
local usesLeft = guardianAngelMaxUses

-- Функция для активации способности
local function activateGuardianAngel()
    if usesLeft > 0 then
        -- Активируем способность (например, защита от урона или восстановление здоровья)
        print("Guardian Angel активирован!")
        -- Ваш код для активации эффекта Guardian Angel (например, бессмертие или защита от урона)
        usesLeft = usesLeft - 1
    else
        print("Все использования способности завершены!")
    end
end

-- Проверка, завершена ли игра
local gameEnded = false

-- Функция для обработки завершения игры
game:GetService("Players").PlayerAdded:Connect(function(player)
    if gameEnded then
        -- Когда игрок снова появляется в игре, мы активируем способность снова
        activateGuardianAngel()
    end
end)

-- Слушаем изменение состояния игры (например, завершение игры)
game:GetService("RunService").Heartbeat:Connect(function()
    if game.GameOver then  -- Проверяем, завершена ли игра
        gameEnded = true
        print("Игра завершена. Способность отключена.")
    else
        gameEnded = false
    end
end)

-- Включаем способность при необходимости, например, через горячие клавиши или события
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.E then  -- Например, используем клавишу "E"
        if not gameEnded then
            activateGuardianAngel()
        else
            print("Игра закончена. Способность не доступна.")
        end
    end
end)

-- Если нужно использовать её постоянно, например, при входе в игру или на старте:
activateGuardianAngel()
