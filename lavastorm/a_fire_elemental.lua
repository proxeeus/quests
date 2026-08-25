function event_combat(e)
	if(e.joined) then
		e.self:Emote("charges ahead with the intent to pummel its victim.");
	end
end

function event_death_complete(e)
	e.self:Emote("dissipates as it hits the ground.");
end
