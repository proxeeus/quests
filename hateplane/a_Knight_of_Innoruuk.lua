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

function event_signal(e)
	if(e.signal == 10) then
		e.self:Shout("All praise Innoruuk, our lord and creator!");
	end
end