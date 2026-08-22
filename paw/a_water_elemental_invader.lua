function event_combat(e)
	if(e.joined) then
		e.self:Emote("hurries toward you, leaving a large globules of water behind.");
	end
end

function event_death_complete(e)
	e.self:Emote("cascades into a large pool of water.");
	if(math.random(100) < 10) then
		eq.unique_spawn(18013,0,0,213,734,-19,412); -- Tidemaster Aquinius
	end
end
