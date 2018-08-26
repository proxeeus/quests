function event_death_complete(e)
	local qglobals = eq.get_qglobals();
	
	if(qglobals["sirran"] == nil and eq.get_entity_list():IsMobSpawnedByNpcTypeID(71009) == false) then
		eq.set_global("sirran","5",3,"M20");
		eq.spawn2(71058,0,0,955,-570,466,390);
	elseif(eq.get_entity_list():IsMobSpawnedByNpcTypeID(71013)) then
		eq.update_spawn_timer(6545,1000); --update to respawn in 1 sec if vanquisher or guardian are still up
	end
end

function event_cast_begin(e)
	if(e.spell:ID() == 982) then
		e.self:Shout(e.self:GetTarget():GetName() .. "!");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
