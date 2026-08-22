function event_combat(e)
	if(e.joined) then
		e.self:Emote("moves inward ready to strike.");
	end
end

function event_death_complete(e)
	e.self:Emote("pitches forward, clutching his wounds.");
end
