function event_spawn(e)
	local randomface = require("random_face");
	randomface.RandomFace(e.self, eq);
end


function event_combat(e)
	if e.joined then
		e.self:Say("Help me!  Let me out!  Don't leave me here!");
	end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end
