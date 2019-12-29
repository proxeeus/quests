function event_combat(e)

	if(e.joined == true) then
		e.self:Say("You are no match for the Dragoons.");
	end
end

function event_death_complete(e)
	e.self:Say("There is no finer death than to fall in battle against the foes of my creator.");
end

function event_spawn(e)
	local randomface = require("random_face");
	randomface.RandomFace(e.self, eq);
end