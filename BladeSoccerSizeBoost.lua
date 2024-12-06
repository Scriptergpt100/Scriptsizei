local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Увеличение размера
local function doubleSize()
    if character then
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Size = part.Size * 2
            end
        end
        if character:FindFirstChild("Humanoid") then
            character.Humanoid.HipHeight = character.Humanoid.HipHeight * 2
        end
    end
end

-- Вызов функции
doubleSize()
