-- Получаем ссылку на персонажа игрока
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        -- Функция для изменения размера персонажа
        function IncreaseSize()
            -- Увеличиваем размер персонажа
            character.Humanoid.BodyWidthScale.Value = 3
            character.Humanoid.BodyHeightScale.Value = 3
            character.Humanoid.BodyDepthScale.Value = 3
        end

        -- Функция для изменения ауры и глаз
        function ApplyAuraAndEyes()
            -- Создаем черную ауру
            local aura = Instance.new("Part")
            aura.Size = Vector3.new(10, 10, 10)
            aura.Shape = Enum.PartType.Ball
            aura.Position = character.HumanoidRootPart.Position
            aura.Anchored = true
            aura.CanCollide = false
            aura.BrickColor = BrickColor.new("Black")
            aura.Material = Enum.Material.SmoothPlastic
            aura.Parent = character

            -- Создаем красные глаза
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("MeshPart") and part.Name == "Head" then
                    local eye1 = Instance.new("PointLight")
                    eye1.Color = Color3.fromRGB(255, 0, 0)  -- Красный цвет
                    eye1.Parent = part
                    eye1.Range = 5
                    eye1.Brightness = 3
                end
            end
        end

        -- Применяем изменения для всех игроков
        IncreaseSize()
        ApplyAuraAndEyes()
    end)
end)
