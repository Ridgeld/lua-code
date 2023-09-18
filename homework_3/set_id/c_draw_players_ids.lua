function drawPlayersIds()
    addEventHandler ( "onClientRender", root, function()
        for _, target_player in ipairs( getElementsByType( "player" ) ) do
            if target_player ~= localPlayer then
                local x, y, z = getPedBonePosition( target_player, 8 ); -- head
                local sX, sY = getScreenFromWorldPosition( x, y, z+0.5 );
                dxDrawText( "id: " .. getElementData( target_player, "id" ), sX-10, sY )
            end
        end
    end )
end
addEventHandler ( "onClientResourceStart", resourceRoot, drawPlayersIds)