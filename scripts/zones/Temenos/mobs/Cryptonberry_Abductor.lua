-----------------------------------
-- Area: Temenos N T
--  Mob: Cryptonberry Abductor
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/limbus")
require("scripts/globals/pathfind")
mixins = { require("scripts/mixins/job_special") }
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------
local entity = {}

local flags = xi.path.flag.NONE
local path =
{
    [2] =
    {
        { -424.000, -80.000, 420.500 },
        { -456.000, -80.000, 420.500 },
    },

    [6] =
    {
        { -460.500, -80.000, 416.000 },
        { -460.500, -80.000, 408.000 },
    },

    [10] =
    {
        { -419.500, -80.000, 416.000 },
        { -419.500, -80.000, 408.000 },
    },
}

entity.onMobRoam = function(mob)
    local offset = mob:getID() - ID.mob.TEMENOS_N_MOB[6]
    local pause = mob:getLocalVar("pause")
    if pause < os.time() then
        local point = (mob:getLocalVar("point") % 2)+1
        mob:setLocalVar("point", point)
        mob:pathTo(path[offset][point][1], path[offset][point][2], path[offset][point][3], flags)
        if offset == 2 then
            mob:setLocalVar("pause", os.time()+30)
        else
            mob:setLocalVar("pause", os.time()+15)
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        if GetNPCByID(ID.npc.TEMENOS_N_GATE[6]):getAnimation() == xi.animation.CLOSE_DOOR then
            xi.limbus.handleDoors(mob:getBattlefield(), true, ID.npc.TEMENOS_N_GATE[6])
        end
    end
end

return entity
