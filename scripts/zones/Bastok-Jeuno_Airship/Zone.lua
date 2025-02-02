-----------------------------------
-- Zone: Bastok-Jeuno_Airship
-----------------------------------
local ID = require('scripts/zones/Bastok-Jeuno_Airship/IDs')
require('scripts/globals/zone')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 or player:getYPos() == 0 or player:getZPos() == 0 then
        player:setPos(math.random(-4, 4), 1, math.random(-23, -12))
    end

    return cs
end

zoneObject.onTransportEvent = function(player, transport)
    player:startEvent(100)
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
    if csid == 100 then
        local prevzone = player:getPreviousZone()
        if prevzone == xi.zone.PORT_JEUNO then
            player:setPos(-75, 2.39, -34.83, 0, 236)
        elseif prevzone == xi.zone.PORT_BASTOK then
            player:setPos(-47.69, 12, -109.88, 0, 246)
        else
            --fix for black screen if prevzone is not getting set correctly
            --or the player logged out during the airship, and the pos_prevzone was set TO the airship
            --set to Port Jeuno position 0,0,0
            player:setPos(0, 0, 0, 0, 246)
        end
    end
end

return zoneObject
