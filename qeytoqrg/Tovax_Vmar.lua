function event_say(e)
	e.self:Say("Is that your BREATH..or did something die in here..now go away!");
end

function event_combat(e)
	e.self:Say("Ooh... Aaah! No! Please! Ouch...Aarghhhhh!");
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end
