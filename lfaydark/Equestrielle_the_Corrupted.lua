function event_combat(e)
	if e.joined then
		e.self:Say("You shall die this day, foolish whelp, but it is not unto me that you will give you live, but to firiona Vie's failure you shall perish!");
	end
end

function event_death_complete(e)
	e.self:Say("A single battle you have won, but so quick to think that this will be the end?  I, like Fear, am eternal, and in your dreams, I shall forever haunt.");
end
