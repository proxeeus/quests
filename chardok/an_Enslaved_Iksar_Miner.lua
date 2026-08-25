function event_combat(e)
    if e.joined then
        e.self:Say("You will join us in the mines!")
    end
end

function event_death_complete(e)
    e.self:Emote("falls to the ground in a rain of bones.")
end
