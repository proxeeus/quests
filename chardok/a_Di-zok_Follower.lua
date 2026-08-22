function event_combat(e)
    if e.joined then
        e.self:Emote("growls and attacks!")
    end
end

function event_death_complete(e)
    e.self:Say("Guards, save me!")
end
