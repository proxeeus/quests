function event_combat(e)
	if(e.joined) then
		e.self:Say("Death!! Death to all who oppose the Crushbone orcs!!");
	end
end

function event_death_complete(e)
	e.self:Say("You shall have all the Crushbone orc legions on your tail for my death!");
end