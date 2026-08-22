function event_combat(e)
	if(e.joined) then
		e.self:Say("Of dragon kin I come at thee, now is time for you to flee!");
	end
end

function event_death_complete(e)
	e.self:Say("Life is lost, how can this be?  It was you who was to die, not me!");
end
