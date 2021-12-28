function event_slay(e)
	e.self:Say("You should have stayed in bed this day.");
end

function event_death_complete(e)
	e.self:Say("What?!?  I should have easily evaded that blow!");
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