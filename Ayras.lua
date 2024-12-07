-- Ссылка на скрипт на GitHub
local scriptUrl = "https://raw.githubusercontent.com/Scriptergpt100/Scriptsizei/main/Pp.lua"

-- Основной блок загрузки и выполнения
local success, errorMessage = pcall(function()
    -- Загружаем содержимое файла
    local scriptContent = game:HttpGet(scriptUrl, true)

    -- Выполняем содержимое через loadstring
    local loadedScript = loadstring(scriptContent)

    if loadedScript then
        loadedScript() -- Выполняем скрипт
    else
        error("Ошибка: не удалось загрузить или выполнить скрипт!")
    end
end)

-- Если произошла ошибка
if not success then
    warn("Ошибка при загрузке скрипта: " .. errorMessage)
end

-- Дополнительная логика (увеличение размера, аура и глаза)
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        -- Увеличение размера
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.BodyWidthScale.Value = 3
            humanoid.BodyHeightScale.Value = 3
            humanoid.BodyDepthScale.Value = 3
        end

        -- Создаем черную ауру
        local aura = Instance.new("Part")
        aura.Size = Vector3.new(10, 10, 10)
        aura.Shape = Enum.PartType.Ball
        aura.Position = character.HumanoidRootPart.Position
        aura.Anchored = true
        aura.CanCollide = false
        aura.BrickColor = BrickColor.new("Black")
        aura.Material = Enum.Material.SmoothPlastic
        aura.Transparency = 0.5
        aura.Parent = character

        -- Создаем красные глаза
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("MeshPart") and part.Name == "Head" then
                local eyeLight = Instance.new("PointLight")
                eyeLight.Color = Color3.fromRGB(255, 0, 0) -- Красный цвет
                eyeLight.Brightness = 5
                eyeLight.Range = 10
                eyeLight.Parent = part
            end
        end
    end)
end)
