local x,y = guiGetScreenSize()
local rx, ry = 180, 180

function isMouseInPosition ( x, y, width, height )
	if ( not isCursorShowing( ) ) then
		return false
	end
	local sx, sy = guiGetScreenSize ( )
	local cx, cy = getCursorPosition ( )
	local cx, cy = ( cx * sx ), ( cy * sy )
	
	return ( ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) )
end

function start()
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



-- Modified version for DX Text
-- function isCursorOverText(posX, posY, sizeX, sizeY)
-- 	if ( not isCursorShowing( ) ) then
-- 		return false
-- 	end
-- 	local cX, cY = getCursorPosition()
-- 	local screenWidth, screenHeight = guiGetScreenSize()
-- 	local cX, cY = (cX*screenWidth), (cY*screenHeight)

-- 	return ( (cX >= posX and cX <= posX+(sizeX - posX)) and (cY >= posY and cY <= posY+(sizeY - posY)) )
-- end
local panelX, panelY, panelW, panelH = (x/2)+40, (y/2)+120, 120, 40
local panelColor = tocolor(0, 250, 255, 255)
local textColor = tocolor(55,55,55, 255)
function menu()
    showCursor(true)
    if isMouseInPosition(panelX, panelY, panelW, panelH) then 
        panelColor = tocolor(0, 250, 255, 255)
    else
        panelColor = tocolor(230, 230, 230, 255)
    end
    dxDrawRectangle((x/2)-rx, (y/2)-ry, rx*2, ry*2, tocolor(50, 50, 50, 255), false, false)
    dxDrawRectangle(panelX, panelY, panelW, panelH, panelColor, false, false)
end



addEvent('WinOpen', true)
addEventHandler('WinOpen', root, function()
    outputChatBox("Линия")
    addEventHandler("onClientRender", root, menu)
end)

function PressedKey(button, press)
    if button == 'f' then -- Only output when they press it down
        addEventHandler("onClientRender", root, menu)
    end
end
addEventHandler("onClientKey", root, PressedKey)

function menu()
    showCursor(true)
    if isMouseInPosition(panelX, panelY, panelW, panelH) then 
        panelColor = tocolor(0, 250, 255, 255)
        textColor = tocolor(55,55,55, 255)
    else
        panelColor = tocolor(230, 230, 230, 255)
        textColor = tocolor(11,11,11, 255)
    end
    dxDrawRectangle((x/2)-rx, (y/2)-ry, rx*2, ry*2, tocolor(50, 50, 50, 255), false, false)
    dxDrawRectangle(panelX, panelY, panelW, panelH, panelColor, false, false)
    dxDrawText('Принять',(x/2)+75, (y/2)+135, 120, 40, textColor)
end

--закрытие окна
function onClick(button, state)
	if (button == "left") and (state == "up") then
		-- check if dx-rectangle is showing here
		if isMouseInPosition( panelX, panelY, panelW, panelH ) then
            outputChatBox('hi')
            removeEventHandler('onClientRender',root, menu)
            showCursor(false)
		end
	end
end
addEventHandler( "onClientClick", root, onClick )


addEvent('WinClose', true)
addEventHandler('WinClose', root, function()
    outputChatBox("Закрыто")
    setPedAnimation(player, "ped", "seat_down", -1, false, false, false, false)
end)



