function event_combat(e)
	if(e.joined) then
		e.self:Say("That was not a very intelligent thing to do.");
	end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end
