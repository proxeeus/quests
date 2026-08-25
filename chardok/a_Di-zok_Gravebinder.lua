function event_combat(e)
    if e.joined then
        e.self:Emote("'s hands begin to crackle with energy!")
    end
end

function event_death_complete(e)
    e.self:Emote("stammers as it tries to cast one last spell.")
end
