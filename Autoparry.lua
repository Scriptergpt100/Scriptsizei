-- Инициализация переменных
local playerName = "Cheater100561"  -- Имя игрока
local player = game.Players:WaitForChild(playerName)
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local lastParryTime = 0
local parryCooldown = 0.1  -- Задержка между парированиями

-- Функция для парирования
function autoParry(ball)
    if tick() - lastParryTime > parryCooldown then
        -- Перемещаем персонажа к мячу
        character.HumanoidRootPart.CFrame = CFrame.new(character.HumanoidRootPart.Position, ball.Position)
        -- Выполняем парирование
        game:GetService("ReplicatedStorage").Remotes.ParryButtonPress:Fire()
        lastParryTime = tick()  -- Обновляем время последнего парирования
    end
end

-- Функция для активации авто парирования
function activateAutoParry()
    print("Auto Parry активирован!")  -- Сообщение в консоли
end

-- Главный цикл, который проверяет мячи в Blade Ball
while true do
    wait(0.1)  -- Ожидание перед новой проверкой
    for _, ball in next, workspace.Balls:GetChildren() do
        -- Если мяч найден, выполняем парирование
        if ball then
            -- Проверяем наличие объекта, который указывает на активацию
            if not game:GetService("ReplicatedStorage"):FindFirstChild("AutoParryActivated") then
                local autoParryFlag = Instance.new("BoolValue")
                autoParryFlag.Name = "AutoParryActivated"
                autoParryFlag.Parent = game:GetService("ReplicatedStorage")
                activateAutoParry()  -- Выводим сообщение в консоль
            end
            autoParry(ball)
        end
    end
end 
