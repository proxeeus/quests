function event_slay(e)
	e.self:Say("Innoruuk will enjoy the taste of your soul.");
end

function event_death_complete(e)
	e.self:Say("Nooooooo!");
end

function event_spawn(e)
	local randomface = require("random_face");
	randomface.RandomFace(e.self, eq);
end