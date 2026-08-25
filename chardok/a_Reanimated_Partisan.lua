function event_combat(e)
    if e.joined then
        e.self:Emote("rattles as it strikes out at you!")
    end
end

function event_death_complete(e)
    e.self:Emote("crumbles to the ground.")
end
