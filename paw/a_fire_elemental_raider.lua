function event_combat(e)
	if(e.joined) then
		e.self:Emote("grins, small flames shooting from its mouth. 'You will now feel the fires as the pathetic gnolls did! Prepare to die!");
	end
end

function event_death_complete(e)
	e.self:Emote("collapses into a pile of ash.");
	if(math.random(100) < 10) then
		eq.unique_spawn(18010,0,0,183,1217,5,384); -- Blazemaster Arnab
	end
end
