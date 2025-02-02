-----------------------------------
-- Rear Lasers
-- Fires aft lasers at players behind user. Additional effects: Petrification
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/mobskills")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target,mob,skill)
    -- skillList  54 = Omega
    -- skillList 727 = Proto-Omega
    -- skillList 728 = Ultima
    -- skillList 729 = Proto-Ultima
    local skillList = mob:getMobMod(xi.mobMod.SKILL_LIST)

    if (skillList == 54 or (skillList == 727 and mob:getAnimationSub() == 1)) and target:isBehind(mob) then
        return 0
    end
    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local typeEffect = xi.effect.PETRIFICATION

    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, typeEffect, 1, 0, 30))

    return typeEffect
end
return mobskillObject
