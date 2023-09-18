local show_invite = true
addEvent( "inviteToJob", true )
addEventHandler( "inviteToJob", resourceRoot, function( id ) 
    if getElementData( client, "fraction" ) then 
        if show_invite then
            for _, player in ipairs( getElementsByType( "player" )) do
                if getElementData( player, "id" ) == id then
                    if getElementData( player, "fraction" ) then 
                        outputChatBox( "Данный игрок уже состоит во фракции!", client, 255, 0, 0 )
                    else
                        triggerClientEvent( player, "inviteWindow", player, getPlayerName( client ), getElementData( client, "fraction" ) )
                        show_invite = not show_invite
                        setTimer(function() 
                            show_invite = true 
                        end, 1000, 1)
                    end
                else 
                    outputChatBox( "Игрок не найден!", client, 255, 0, 0 )
                end
            end
        else 
            outputChatBox( "Отправлять приглашение можно 1 раз в секунду!", client, 255, 0, 0 )
        end
    else 
        cancelEvent()
    end
end )