function event_combat(e)
	if(e.joined) then
		e.self:Say("Heretic! Thou shalt feel my magic scorn!");
	end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end
