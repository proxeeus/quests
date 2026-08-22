function event_combat(e)
    if e.joined then
        e.self:Emote("growls and attacks you!")
    end
end

function event_death_complete(e)
    e.self:Emote("yelps out in pain and falls to the ground.")
end
