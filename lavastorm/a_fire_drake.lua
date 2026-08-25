function event_combat(e)
	if(e.joined) then
		e.self:Emote("screeches as it spots potential prey.");
	end
end

function event_death_complete(e)
	e.self:Emote("falls to the ground as its wings give out.");
end
