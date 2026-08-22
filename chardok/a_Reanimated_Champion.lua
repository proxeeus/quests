function event_combat(e)
    if e.joined then
        e.self:Emote("cackles and lunges for you!")
    end
end

function event_death_complete(e)
    e.self:Emote("shrieks as bones fly everywhere!")
end
