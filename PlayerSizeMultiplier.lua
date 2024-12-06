-- Скрипт для увеличения размера игрока в 2 раза
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChildOfClass("Humanoid")

if humanoid then
    -- Увеличение размеров тела
    humanoid.BodyWidthScale.Value = humanoid.BodyWidthScale.Value * 2
    humanoid.BodyHeightScale.Value = humanoid.BodyHeightScale.Value * 2
    humanoid.BodyDepthScale.Value = humanoid.BodyDepthScale.Value * 2
    humanoid.HeadScale.Value = humanoid.HeadScale.Value * 2
    print("Размер игрока увеличен в 2 раза!")
else
    print("Не удалось найти Humanoid!")
end
