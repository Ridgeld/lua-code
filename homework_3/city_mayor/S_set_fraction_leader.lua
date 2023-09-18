addCommandHandler( "set_player_fraction_leader", function ( thePlayer, commandName, player_id, fraction_id )
    local player_id = tonumber( player_id )
    local target_player = getPlayerByID( player_id )

    if not player_id and not fraction_id then 
        outputChatBox( "Использование команды: /set_player_fraction_leader [ID игрока] [название_фракции]", thePlayer, 0, 255, 0)
        return
    end

    if not player_id then
        outputChatBox( "Неверный ID игрока!", thePlayer, 255, 0, 0 )
        return
    end
    if not target_player then
        outputChatBox( "Игрок с ID " .. player_id .. " не найден.", player, 255, 0, 0 )
        return
    end

    if not fraction_id then
        outputChatBox( "Игрок: " .. getPlayerName( target_player ) .. " покинул пост лидера фракции ", thePlayer, 0, 255, 0 )
        outputChatBox( "Вы были сняты с поста лидера фракции,  ждем Вас снова!", target_player, 0, 255, 0 )
        setElementModel( target_player, 60 )
        removeElementData( target_player, "rang" )
        removeElementData( target_player, "fraction" )
        return
    end
    if fraction_id ~= "city_mayor" then
        outputChatBox( "Неверно введена фракция!", thePlayer, 255, 0, 0 )
        return
    end

    if not getElementData( target_player, "rang" ) then 
        outputChatBox( "Игрок: " .. getPlayerName( target_player ) .. " стал лидером фракции: ".. fraction_id, thePlayer, 0, 255, 0 )
        outputChatBox( "Вы стали лидером фракции "..fraction_id.." , желаем удачи!", target_player, 0, 0, 255 )
        setElementModel( target_player, 68 )
        setElementData( target_player, "rang", "лидер" )
        setElementData( target_player, "fraction", fraction_id )
    else 
        outputChatBox( "Для повышения необходимо уволиться из организации!", target_player, 255, 0, 0 )
    end

end )
function getPlayerByID( player_id )
    for _, player in ipairs( getElementsByType( "player" ) ) do
        if getElementData( player, "id" ) == player_id then
            return player
        end
    end
    return nil
end

