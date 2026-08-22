function event_combat(e)
	if(e.joined) then
		e.self:Emote("quakes with anger as it moves to attack.");
	end
end

function event_death_complete(e)
	e.self:Emote("rumbles and shakes as it goes through its last death spasms.");
end
