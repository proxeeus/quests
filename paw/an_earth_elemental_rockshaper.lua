function event_combat(e)
	if(e.joined) then
		e.self:Emote("laughs as it rushes to attack you, its voice sounding like a grinding of stones.");
	end
end

function event_death_complete(e)
	e.self:Emote("falls to the ground into a pile of rocks and dirt.");
	if(math.random(100) < 10) then
		eq.unique_spawn(18015,0,0,-130,871,-21,256); -- Earthmaster Grundag
	end
end
