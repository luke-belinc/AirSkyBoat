-----------------------------------
-- xi.effect.ETUDE
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(effect:getSubPower(), effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
    -- the effect loses modifier of 1 every 10 ticks.
    local song_effect_size = effect:getPower()
    if (effect:getTier() == 2 and effect:getPower() > 0) then
        effect:setPower(song_effect_size -1)
        target:delMod(effect:getSubPower(), 1)
    end
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(effect:getSubPower(), effect:getPower())
end

return effectObject
