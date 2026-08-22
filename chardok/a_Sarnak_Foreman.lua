function event_combat(e)
    if e.joined then
        e.self:Say("I will wash the Overking's feet in your blood!")
    end
end

function event_death_complete(e)
    e.self:Emote("collapses to the ground.")
end
