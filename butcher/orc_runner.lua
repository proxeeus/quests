function event_combat(e)
	if(e.joined) then
		e.self:Say("Death!  Death to all who oppose the Crushbone orcs!");
	end
end

function event_death_complete(e)
	e.self:Say("Fool! The dark elves will slay you for interfering with my duties!");
end
