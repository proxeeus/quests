function event_combat(e)
    if e.joined then
        e.self:Say("Your demise is my purpose!")
    end
end

function event_death_complete(e)
    e.self:Emote("seems to fade as it hits the ground.")
end
