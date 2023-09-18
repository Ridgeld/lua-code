addEvent( "kickFromJob", true )
addEventHandler( "kickFromJob", resourceRoot, function( id )
    if getElementData( client, "Fraction" ) then 
        for _, player in ipairs( getElementsByType( "player" )) do
            if getElementData( player, "id" ) == id then
                removeElementData( player, "rang" )
                removeElementData( player, "fraction" )
                setElementModel( player, 60 )
                outputChatBox("Вы были уволены из фракции: " .. getElementData( client, "fraction" ) .. " игроком: ".. getPlayerName( client ), player, 255, 0, 0)
                triggerClientEvent( player, "closeWindow", player )
            end
        end
    else 
        cancelEvent()
    end
end )