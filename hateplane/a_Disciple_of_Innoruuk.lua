function event_death_complete(e)
	e.self:Say("If only I had my pet . . . . .");
end

function event_spawn(e)
	local randomface = require("random_face");
	randomface.RandomFace(e.self, eq);
end

function event_signal(e)
	if(e.signal == 10) then
		e.self:Shout("All praise Innoruuk, our lord and creator!");
	end
end