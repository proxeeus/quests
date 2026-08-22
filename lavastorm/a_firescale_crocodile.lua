function event_combat(e)
	if(e.joined) then
		e.self:Emote("slithers towards its prey, ready to attack.");
	end
end

function event_death_complete(e)
	e.self:Emote("sinks to the ground, its scales dripping with rivulets of blood.");
end
