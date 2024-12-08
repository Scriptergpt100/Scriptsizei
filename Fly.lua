local player = game.Players.LocalPlayer
local character = player.Character
local userInterface = game:GetService("UserInputService")
local button = script.Parent -- Предполагается, что скрипт является дочерним элементом кнопки

button.Text = "Fly, " .. player.Name .. "!"

userInterface.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then -- Замена на событие клика по кнопке
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Parent = character.HumanoidRootPart
        bodyVelocity.Velocity = Vector3.new(0, 20, 0) -- Настроить скорость по желанию
    end
end)
