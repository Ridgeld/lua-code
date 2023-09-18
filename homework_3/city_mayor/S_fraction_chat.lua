addCommandHandler( "f", function( thePlayer, commandName, ... )
    local fractionPlayer = getFractionPlayers()
    if getElementData( thePlayer, "rang" ) == "лидер" then 
        local message = table.concat({...}, " " )
        outputChatBox( "[Лидер]: "..message, fractionPlayer, 150, 150, 150 )
    end
    if getElementData( thePlayer,"rang" ) == "сотрудник" then 
        local message = table.concat({...}, " " )
        outputChatBox( "[Сотрудник]: "..message, fractionPlayer, 150, 150, 150 )
    end
end )


function getFractionPlayers()
    local eligible_players = {} -- Создаем пустую таблицу для хранения игроков с нужными данными
    
    for _, player in ipairs( getElementsByType( "player" ) ) do
        if getElementData( player, "fraction" ) then
            table.insert( eligible_players, player )
        end
    end

    return eligible_players -- Возвращаем список игроков, у которых есть нужные данные
end