function event_combat(e)
    if e.joined then
        e.self:Emote("begins to chant as it attacks!")
    end
end

function event_death_complete(e)
    e.self:Emote("shrieks in pain and falls to the ground!")
end
