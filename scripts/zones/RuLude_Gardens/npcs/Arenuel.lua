-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Arenuel
-----------------------------------
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}

local path =
{
    { x = 36, y = 1.996, z = 63, rotation = 0, wait = 8000 },
    { z = 59, rotation = 0, wait = 8000 },
    { z = 71, rotation = 0, wait = 8000 },
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(xi.path.first(path))
    npc:pathThrough(path, xi.path.flag.PATROL)
end

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(120)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
