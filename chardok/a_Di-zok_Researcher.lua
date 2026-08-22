function event_combat(e)
    if e.joined then
        e.self:Emote("murmurs in a strange language as it initiates its attack")
    end
end

function event_death_complete(e)
    e.self:Emote("begins to shake as the mana burns within its body.")
end
