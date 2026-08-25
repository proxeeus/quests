function event_combat(e)
    if e.joined then
        e.self:Emote("hands ignite with power as it begins to attack!")
    end
end

function event_death_complete(e)
    e.self:Say("I have miscalculated your skill? my mistake is my undoing.")
end
