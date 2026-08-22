function event_combat(e)
	if(e.joined) then
		e.self:Emote("swivels its body towards potential prey.");
	end
end

function event_death_complete(e)
	e.self:Emote("falls to the ground dead, although its legs continue to twitch.");
end
