function event_combat(e)
	if(e.joined) then
		e.self:Emote("rustles its leaves as it moves to attack.");
	end
end

function event_death_complete(e)
	e.self:Emote("shrivels up into a dead husk.");
end