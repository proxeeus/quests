function event_combat(e)
	if e.joined then
		e.self:Say("Let me show you the high power of the Crushbone oracles!!");
	end
end

function event_death_complete(e)
	e.self:Say("You shall have all the Crushbone orc legions on your tail for my death!");
end
