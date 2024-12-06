local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Переменные для команд
local teamColor = nil
local redTeamColor = Color3.fromRGB(255, 0, 0)  -- Красная команда
local blueTeamColor = Color3.fromRGB(0, 0, 255) -- Синяя команда

-- Определение команды игрока
if player.Team and player.Team.Name == "Red" then
    teamColor = redTeamColor
elseif player.Team and player.Team.Name == "Blue" then
    teamColor = blueTeamColor
end

-- Если игрок не в игре, скрипт не будет работать
if not teamColor then
    return
end

-- Функция для захвата мяча
local function captureBall(ball)
    -- Проверяем, является ли мяч правильного цвета
    if ball:IsA("BasePart") and ball.Color == teamColor then
        -- Притягиваем мяч к игроку
        ball.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)  -- Мяч появится немного выше
        -- Можно добавить анимацию или эффекты, если нужно
    end
end

-- Слушаем мяч на поле
game:GetService("Workspace").Ball.Touched:Connect(function(hit)
    -- Проверяем, что мяч касается персонажа
    if hit.Parent == character then
        captureBall(hit.Parent)
    end
end)
