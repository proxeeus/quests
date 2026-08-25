function event_combat(e)
	if (e.joined) then
		e.self:Say("Die!  Another trophy for the House of Funter!");
	end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end
