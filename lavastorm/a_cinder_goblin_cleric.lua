function event_combat(e)
	if(e.joined) then
		e.self:Emote("narrows its eyes which glow with an inner heat.");
	end
end

function event_death_complete(e)
	e.self:Emote("falls and begins to smolder.");
end
