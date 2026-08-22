function event_combat(e)
    if e.joined then
        e.self:Say("You dare enter our home? Your suffering will be eternal!")
    end
end

function event_death_complete(e)
    e.self:Say("Re-animate me for the coming battle!")
end
