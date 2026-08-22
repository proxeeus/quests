function event_combat(e)
	if e.joined then
		e.self:Emote("hobbles ahead with a menacing mossy grin.");
	end
end

function event_death_complete(e)
	e.self:Emote("breaks apart into an uneven loamy clod.");
end
