function event_combat(e)
	if (e.joined) then
		e.self:Say("What sport it shall be to hunt you. Run, while you can!");
	end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end
