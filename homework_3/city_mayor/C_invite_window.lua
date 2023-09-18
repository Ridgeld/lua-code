addEvent( "inviteWindow", true )
addEventHandler( "inviteWindow", localPlayer, function ( player_name, fraction_id )
    if isElement( INVITE_WINDOW ) then 
        showCursor( false )
        destroyElement( INVITE_WINDOW )
    else
        showCursor( true )
        INVITE_WINDOW = guiCreateWindow ( 0.3, 0.3, 0.3, 0.2, "Приглашение", true ) 
        guiCreateLabel(0.03, 0.2, 0.9, 0.9, player_name .. " приглашает вас вступить во фракцию: "..fraction_id , true, INVITE_WINDOW) 
        ACCEPT = guiCreateButton( 0.4, 0.7, 0.3, 0.2, "Принять", true, INVITE_WINDOW)
        CLOSE = guiCreateButton( 0.7, 0.7, 0.3, 0.2, "Отклонить", true, INVITE_WINDOW)

        addEventHandler( "onClientGUIClick", CLOSE, closeWindow, false )
        addEventHandler( "onClientGUIClick", ACCEPT, acceptInvite, false )
    end
end )

function closeWindow()
    destroyElement( INVITE_WINDOW )
    showCursor( false )
end

function acceptInvite()
    triggerServerEvent("acceptInvite", resourceRoot, localPlayer)
end