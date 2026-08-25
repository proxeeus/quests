function event_combat(e)
    if e.joined then
        e.self:Emote("smiles as its eyes begin to burn brightly")
    end
end

function event_death_complete(e)
    e.self:Emote("screams in pain and falls to the ground!")
end
