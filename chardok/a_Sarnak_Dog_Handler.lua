function event_combat(e)
    if e.joined then
        e.self:Emote("swings at you with incredible speed!")
    end
end

function event_death_complete(e)
    e.self:Emote("curses you as it falls dead.")
end
