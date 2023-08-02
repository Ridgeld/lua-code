addEventHandler("onResourceStart", resourceRoot, printMessage)
local spawnX, spawnY, spawnZ = 1959.55, -1714.66, 10
function joinHandler()
    spawnPlayer(source, spawnX, spawnY, spawnZ)
    fadeCamera(source, true)
    setCameraTarget(source, source)
    outputChatBox('Это тестовый сервер для интерфейсов)', source)
end 
addEventHandler('onPlayerJoin', getRootElement(), joinHandler)

-- function consoleCreateMarker( thePlayer, commandName)
--     if (thePlayer) then 
--         local x, y, z = getElementPosition (thePlayer)
--         local marker = createMarker( x+2, y+2, z-1, 'cylinder', 1.5, 255, 255, 0, 170)
--         if (marker) then 
--             outputConsole("Маркер создан", thePlayer)
--         else 
--             outputConsole("Маркер не создан", thePlayer)
--         end 
--     end 
-- end 
-- addCommandHandler('createmarker', consoleCreateMarker)

local marker = createMarker(1959.55, -1716.66, 15, 'cylinder', 2.0, 50, 50, 50, 170)

addEventHandler('onMarkerHit',marker, function(player)
    outputChatBox('Маркер', player)
    triggerClientEvent('WinOpen', player)
end)

addEventHandler('onMarkerLeave',marker, function(player)
    outputChatBox("Вышел")
    triggerClientEvent('WinClose', player)
    setPedAnimation(player, "ped", "seat_down", -1, false, false, false, false)
end)


addCommandHandler('create', 
function(thePlayer, commandName, vehicleModel)
    local x,y,z = getElementPosition(thePlayer)
    local veh = createVehicle(tonumber(vehicleModel), x+5, y, z)
end)