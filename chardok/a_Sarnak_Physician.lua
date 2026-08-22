function event_combat(e)
    if e.joined then
        e.self:Say("You are about to witness your destruction. Pay attention!")
    end
end

function event_death_complete(e)
    e.self:Say("Forgive me! I have failed in my purpose!")
end
