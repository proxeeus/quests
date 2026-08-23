function event_spawn(e)
	local randomface = require("random_face");
	randomface.RandomFace(e.self, eq);
end

function event_slay(e)
	e.self:Say("Haha!! Another victory for our lord Cazic-Thule!  May your corpse be a dread-inspiring sign to those who travel this forest!");
end
