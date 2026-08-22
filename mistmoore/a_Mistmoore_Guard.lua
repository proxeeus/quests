function event_spawn(e)
	local randomface = require("random_face");
	randomface.RandomFace(e.self, eq);
end


function event_combat(e)
	if e.joined then
		local lines = {
			"Do not underestimate the might of Mistmoore!",
			"Submit before the sovereign might of Mayong Mistmoore!",
		};
		e.self:Say(lines[math.random(#lines)]);
	end
end
