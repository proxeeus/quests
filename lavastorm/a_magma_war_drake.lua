function event_combat(e)
	if(e.joined) then
		e.self:Emote("circles in to attack.");
	end
end

function event_death_complete(e)
	e.self:Emote("crumples into a tangled mass of blood and broken wings.");
end
