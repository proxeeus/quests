function event_combat(e)
    if e.joined then
        e.self:Say("Korucrust's lies will be exposed! You cannot deceive Prince Selrach!")
    end
end

function event_death(e)
    e.self:Say("This is treason! I have done nothing wrong!")
end
