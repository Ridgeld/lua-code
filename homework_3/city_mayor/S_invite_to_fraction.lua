addEvent( "acceptInvite", true )
addEventHandler( "acceptInvite", resourceRoot, function( id ) 
    outputChatBox( id , client)
    -- for _, player in ipairs( getElementsByType( "player" )) do
    --     if getElementData( player, "id" ) == id then
    --         triggerClientEvent( player, "inviteWindow", player, getPlayerName( client ) )
    --     else 
    --         outputChatBox( "Игрок не найден!", client )
    --     end
    -- end
end )