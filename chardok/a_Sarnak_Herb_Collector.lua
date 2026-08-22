function event_combat(e)
    if e.joined then
        e.self:Emote("howls savagely as it attacks!")
    end
end

function event_death_complete(e)
    e.self:Emote("drops to the ground and begins to twitch.")
end
