function event_combat(e)
    if e.joined then
        e.self:Emote(eq.ChooseRandom(
            "begins to glow strangely and attacks!",
            "pounds its fists together and looks for another victim."
        ))
    end
end

function event_death_complete(e)
    e.self:Emote("roars as it falls apart!")
end
