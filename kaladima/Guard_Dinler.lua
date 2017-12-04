function event_combat(e)
	e.self:Say("For the glory of Kaladim, have at thee!!");
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end

function event_slay(e)
	e.self:Say("For the glory of Kaladim!! You are no more.");
end
