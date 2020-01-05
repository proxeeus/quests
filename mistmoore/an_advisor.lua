function event_spawn(e)
	local randomface = require("random_face");
	randomface.RandomFace(e.self, eq);
end


function event_combat(e)
	e.self:Say("Do not underestimate the might of Mistmoore!");
end

function event_death_complete(e)
	eq.spawn2(59129,0,0,-167,88,-221,113); -- NPC: a_greater_spirit
end