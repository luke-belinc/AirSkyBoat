-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Clainomille
-- Type: Standard NPC
-- !pos -72.771 0.999 -6.112 230
-----------------------------------
require("scripts/globals/pathfind")
-------------------------------------
local entity = {}

local path =
{
    { x = -66.767, y = 2.000, z = -11.673, rotation = 220, wait = 8000 },
    { x = -74.918, z = -4.125, rotation = 220, wait = 8000 },
    { x = -76.530, z = 0.443 },
    { x = -75.314, z = 1.616, rotation = 35, wait = 8000 },
    { x = -76.530, z = 0.443 },
    { x = -74.918, z = -4.125 },
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(xi.path.first(path))
    npc:pathThrough(path, xi.path.flag.PATROL)
end

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(613)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
