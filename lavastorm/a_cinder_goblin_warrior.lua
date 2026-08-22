function event_combat(e)
	if(e.joined) then
		e.self:Emote("glares menacingly as the air fills with the smell of ash and smoke.");
	end
end

function event_death_complete(e)
	e.self:Emote("falls as its remains turn to a fine ash.");
end
