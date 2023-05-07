function event_combat(e)
	if (e.joined) then
		e.self:Emote("screeches shrilly as it swoops in to attack.");
	end
end

function event_death_complete(e)
	e.self:Emote("falls to the ground with a pathetic screech.");
end