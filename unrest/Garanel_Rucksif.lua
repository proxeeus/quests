function event_combat(e)
	if(e.joined) then
		e.self:Say(string.format("Time to die, %s.", e.other:GetName()));
	end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end
