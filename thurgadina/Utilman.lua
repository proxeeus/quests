-- Script controlling thurgadina's zone behaviour in the event of a Kromrif victory during Ring 10.

-- spawn_condition = 0: mobs will always be up no matter what (like Utilman)
-- spawn_condition = 1: default thurgadina state
-- spawn_condition = 2: thurgadina's npcs are dead, bodies will be spawned instead

-- Two hours in milliseconds
local respawn_time = 7200000

function event_signal(e)
	if(e.signal == 1) then	-- Coldains lost the war, depop Thurgadina and spawn bodies
		eq.set_timer("war_despawn", respawn_time);
		Despawn(e);
	elseif(e.signal == 2) then
		eq.stop_timer("war_despawn");
		Respawn(e);
	end
end

function event_timer(e)
	if (e.timer == "war_despawn") then
		eq.signal(115231, 2);
	end
end

-- This is for testing / debugging purpose only!
function event_say(e)
	if (e.other:Admin() >= 80 and e.other:GetGM()) then
		if (e.message:findi('end')) then
			eq.signal(115231, 2);
		elseif (e.message:findi('start')) then
			eq.signal(115231, 1);
		end
	end
end


function Respawn(e)
	eq.spawn_condition("thurgadina", 0, 1, 1);
	eq.spawn_condition("thurgadina", 0, 2, 0);
end

function Despawn(e)
	eq.spawn_condition("thurgadina", 0, 1, 0);
	eq.spawn_condition("thurgadina", 0, 2, 1);
end