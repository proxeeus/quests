function event_combat(e)
    if e.joined then
        e.self:Emote("attacks in a cloud of dust and grime!")
    end
end

function event_death_complete(e)
    e.self:Say("I have been vanquished once again!")
end
