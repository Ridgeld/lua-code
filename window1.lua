local x, y = guiGetScreenSize()
local rx, ry = 200, 150
function start()
    -- local dr = dxDrawRectangle((x/2)-rx, (y/2)-ry, rx*2, ry*2, tocolor(255,255, 255, 255))
    function dxDrawRoundedRectangle(x, y, rx, ry, color, radius)
        rx = rx - radius * 2
        ry = ry - radius * 2
        x = x + radius
        y = y + radius

        if (rx >= 0) and (ry >= 0) then
            dxDrawRectangle(x, y, rx, ry, color)
            dxDrawRectangle(x, y - radius, rx, radius, color)
            dxDrawRectangle(x, y + ry, rx, radius, color)
            dxDrawRectangle(x - radius, y, radius, ry, color)
            dxDrawRectangle(x + rx, y, radius, ry, color)

            dxDrawCircle(x, y, radius, 180, 270, color, color, 7)
            dxDrawCircle(x + rx, y, radius, 270, 360, color, color, 7)
            dxDrawCircle(x + rx, y + ry, radius, 0, 90, color, color, 7)
            dxDrawCircle(x, y + ry, radius, 90, 180, color, color, 7)
        end
end 
    dxDrawRoundedRectangle((x/2)-rx, (y/2)-ry, rx*2, ry*2, tocolor(50, 50, 50, 255), 10)
end
addEventHandler("onClientMarkerHit", function()
    outputChatBox('Сделано')
    addEventHandler('onClientRender',root, start)
end)
1
--
addCommandHandler('close', function()
    removeEventHandler('onClientRender', root, start)
end)

-- function greetingHandler(message)
--     outputChatBox("The server says: ".. message )
-- end 
-- addEvent('OnGreeting', true)
-- addEventHandler('onGreeting', localPlayer, greetingHandler)
function greetingHandler ( message )
    outputChatBox ( "The server says: " .. message )
end
addEvent( "onGreeting", true )
addEventHandler( "onGreeting", localPlayer, greetingHandler )