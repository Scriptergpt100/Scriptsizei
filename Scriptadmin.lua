-- Простая структура для управления правами администратора
local adminPlayers = {
    ["Cheater100651"] = true,  -- Этот игрок будет администратором
}

-- Функция для проверки прав администратора
function isAdmin(playerName)
    return adminPlayers[playerName] or false
end

-- Команда kick
function kickPlayer(admin, playerName)
    if isAdmin(admin) then
        print(admin .. " kicked " .. playerName)
        -- Логика кика игрока (например, удаление из игры)
    else
        print("You do not have permission to kick players.")
    end
end

-- Команда ban с причиной
function banPlayer(admin, playerName, reason)
    if isAdmin(admin) then
        print(admin .. " banned " .. playerName .. " for the reason: " .. reason)
        -- Логика бана игрока
    else
        print("You do not have permission to ban players.")
    end
end

-- Команда fly
function flyPlayer(admin, playerName)
    if isAdmin(admin) then
        print(admin .. " made " .. playerName .. " fly!")
        -- Логика активации режима полета
    else
        print("You do not have permission to make players fly.")
    end
end

-- Пример использования
kickPlayer("Cheater100651", "Player1")  -- Cheater100651 может кикнуть Player1
banPlayer("Cheater100651", "Player1", "cheating")  -- Cheater100651 может забанить Player1 с причиной "cheating"
flyPlayer("Cheater100651", "Player1")   -- Cheater100651 может активировать полет для Player1
