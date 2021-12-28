function event_slay(e)
	e.self:Say("You knew this was coming, didn't you?");
end

function event_death_complete(e)
	e.self:Say("One day I shall lure you to your doom, but not this day, it seems.");
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