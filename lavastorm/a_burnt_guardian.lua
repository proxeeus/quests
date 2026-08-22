function event_combat(e)
	if(e.joined) then
		e.self:Emote("raises its bones and advances.");
	end
end

function event_death_complete(e)
	e.self:Emote("shatters as it hits the ground, its bones scattered.");
end
