function event_combat(e)
    if e.joined then
        e.self:Emote("growls exposing decaying fangs!")
    end
end

function event_death_complete(e)
    e.self:Emote("curls into a pile as it hits the ground.")
end
