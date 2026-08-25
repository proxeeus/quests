function event_combat(e)
	if(e.joined) then
		e.self:Emote("lets out a hollow laugh. 'You will now feel the wind's cold warning, intruder!'");
	end
end

function event_death_complete(e)
	e.self:Emote("falls to the ground causing a powerful breeze to momentarily envelop you.");
	if(math.random(100) < 10) then
		eq.unique_spawn(18007,0,0,-53,1076,4,200); -- Windlord Brizoris
	end
end
