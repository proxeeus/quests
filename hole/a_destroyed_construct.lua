function event_combat(e)
	if e.joined then
		e.self:Emote("thunders forward with an unstoppable force.");
	end
end

function event_death_complete(e)
	e.self:Emote("falls to the ground with a deafening crash.");
end
