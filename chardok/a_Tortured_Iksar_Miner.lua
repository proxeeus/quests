function event_combat(e)
    if e.joined then
        e.self:Say("Our pain will soon be yours!")
    end
end

function event_death_complete(e)
    e.self:Say("At last... my suffering will end!")
end
