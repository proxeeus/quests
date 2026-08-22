function event_combat(e)
    if e.joined then
        e.self:Emote("growls at you and begins its attack!")
    end
end

function event_death_complete(e)
    e.self:Emote("roars as it falls apart!")
end
