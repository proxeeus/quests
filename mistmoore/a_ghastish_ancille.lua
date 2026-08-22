function event_spawn(e)
	local randomface = require("random_face");
	randomface.RandomFace(e.self, eq);
end


function event_combat(e)
	if e.joined then
		e.self:Say("Do not underestimate the might of Mistmoore!");
	end
end
