local a = game:GetService("VirtualInputManager")
local b = game:GetService("RunService")
local c = game:GetService("Players").LocalPlayer

local e = false
local ping = game:GetService("Stats"):FindFirstChild("Network"):FindFirstChild("ServerStatsItem"):FindFirstChild("Data Ping") -- Получаем пинг

local function getFrameTime()
    local lastFrame = tick()
    game:GetService("RunService").RenderStepped:Connect(function()
        local currentFrame = tick()
        fps = currentFrame - lastFrame
        lastFrame = currentFrame
    end)
end

getFrameTime()

spawn(function()
    b.PreRender:Connect(function()
        if not getgenv().f then return end

        -- Функция для поиска мячика
        local g = game.Workspace:FindFirstChild("Blade Ball") -- Здесь ищем мяч
        if not g then return end

        local velocity = g.AssemblyLinearVelocity
        if g:FindFirstChild('zoomies') then 
            velocity = g.zoomies.VectorVelocity
        end

        local latency = ping:GetValue() / 1000 -- Рассчитываем задержку в секундах
        local predictedPosition = g.Position + velocity * (latency + fps)  -- Прогнозируем позицию мяча с учётом задержки и FPS

        local j = c.Character.PrimaryPart.Position
        local direction = (j - predictedPosition).Unit
        local distance = c:DistanceFromCharacter(predictedPosition)
        local dotProduct = direction:Dot(velocity.Unit)
        local velocityMagnitude = velocity.Magnitude

        if dotProduct > 0 then
            local adjustedDistance = distance - 5
            local predictionRatio = adjustedDistance / velocityMagnitude

            if predictionRatio <= 0.30 and not e then
                -- Улучшенная реакция: мгновенное выполнение парирования с симуляцией касания экрана
                a:SendTouchEvent(Vector2.new(0, 0), true)  -- Симулируем касание для нажатия
                wait(0.01)
                a:SendTouchEvent(Vector2.new(0, 0), false)  -- Симулируем отпускание экрана
                e = true
            end
        else
            e = false
        end
    end)
end)
