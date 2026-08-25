-- a_fire_goblin_scout.lua NPCID: 27126
-- 10% chance to spawn #Scorchfist on death
function event_combat(e)
	if(e.joined) then
		e.self:Emote("narrows its eyes which glow with an inner heat.");
	end
end

function event_death_complete(e)
	e.self:Emote("falls and begins to smolder.");
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(scorchfist)==false) then
		if(math.random(100) < 10) then
			eq.spawn2(27126,101,0,820,1270,-77.9,386);
		end
	end
end
