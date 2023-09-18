function fractionPanel( playerSource )
    triggerClientEvent ( playerSource, "createWindow", playerSource )
end
addEventHandler( "onElementDataChange", root,  function ( theKey, oldValue )
    if ( getElementType ( source ) == "player") then
        if ( theKey == "rang" ) then

            if getElementData( source, "rang" ) then 
                bindKey( source, "p", "down", fractionPanel )
            else 
                unbindKey( source, "p", "down", fractionPanel )
            end
        end
    end
end )




