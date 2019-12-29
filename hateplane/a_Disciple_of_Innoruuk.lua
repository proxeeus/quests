function event_death_complete(e)
	e.self:Say("If only I had my pet . . . . .");
end

function event_spawn(e)
	local randomface = require("random_face");
	randomface.RandomFace(e.self, eq);
end