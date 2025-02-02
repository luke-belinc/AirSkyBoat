-----------------------------------
-- Pod Ejection
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target,mob,skill)
    local pod = GetMobByID(mob:getID() + 1)
    local currentForm = mob:getLocalVar("form")

    if not pod:isSpawned() and currentForm == 2 then -- proto-omega final form
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local battlefield = mob:getBattlefield()
    local pod = GetMobByID(mob:getID() + 1)

    if battlefield and not pod:isSpawned() then
        local players = battlefield:getPlayers()
        local random = math.random(1, #players)
        local xPos = mob:getXPos()
        local yPos = mob:getYPos()
        local zPos = mob:getZPos()

        pod:spawn()
        pod:setPos(xPos, yPos, zPos)
        pod:updateEnmity(players[random])
    end
    return 0
end
return mobskillObject
