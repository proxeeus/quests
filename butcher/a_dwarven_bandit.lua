function event_combat(e)
	e.self:Say("The blades of the Butcherblock Bandits do not discriminate!!");
end

function event_spawn(e)
	local randomface = require("random_face");
	randomface.RandomFace(e.self, eq);
end


function event_death_complete(e)
	e.self:Say("You shall soon feel the daggers of the Butcherblock Bandits upon your back!!");
end