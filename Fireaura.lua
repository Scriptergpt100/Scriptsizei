local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Создание частицы для огненной ауры
local fireAura = Instance.new("ParticleEmitter")
fireAura.Texture = "rbxassetid://245400202" -- Замените на ID текстуры огня
fireAura.Lifetime = NumberRange.new(1, 2)
fireAura.Rate = 100
fireAura.Size = NumberSequence.new(1, 2)
fireAura.Speed = NumberRange.new(5, 10)
fireAura.VelocityInheritance = 0.5

-- Применение эффекта к персонажу
local function createFireAura()
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            local auraClone = fireAura:Clone()
            auraClone.Parent = part
        end
    end
end

-- Создание ауры при загрузке персонажа
createFireAura()

-- Обработка события, если персонаж изменится
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    createFireAura()
end)
