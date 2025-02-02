-----------------------------------
-- Flaming Crush M=10, 2, 2? (STILL don't know)
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/summon")
require("scripts/globals/magic")
require("scripts/globals/mobskills")
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onPetAbility = function(target, pet, skill)
    local numhits = 2
    local accmod = 1
    local dmgmod = 6
    local dmgmodsubsequent = 1
    local wSC = (pet:getStat(xi.mod.STR) * 0.20) + (pet:getStat(xi.mod.INT) * 0.20)

    local totaldamage = 0
    local damage = xi.summon.avatarPhysicalMove(pet, target, skill, numhits, accmod, dmgmod, dmgmodsubsequent, xi.mobskills.magicalTpBonus.NO_EFFECT, 1, 2, 3, wSC)
    --get resist multiplier (1x if no resist)
    local resist = xi.mobskills.applyPlayerResistance(pet, -1, target, pet:getStat(xi.mod.INT)-target:getStat(xi.mod.INT), xi.skill.ELEMENTAL_MAGIC, xi.magic.ele.FIRE)
    --get the resisted damage
    local firedamage = (damage.dmg / 2) * resist
    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    firedamage = xi.mobskills.mobAddBonuses(pet, target, firedamage, 1)
    damage = firedamage + damage.dmg
    totaldamage = xi.summon.avatarFinalAdjustments(damage, pet, skill, target, xi.attackType.PHYSICAL, xi.damageType.FIRE, numhits)
    target:takeDamage(totaldamage, pet, xi.attackType.PHYSICAL, xi.damageType.FIRE)
    target:updateEnmityFromDamage(pet, totaldamage)

    return totaldamage
end

return abilityObject
