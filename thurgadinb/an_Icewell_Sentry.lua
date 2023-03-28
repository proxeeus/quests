function event_combat(e)
	if(e.joined) then
		e.self:Say("Invaders!!  To arms, my fellow guardsmen!  Defend the Keep!  Protect the Dain!");
	end
end

function event_spawn(e)
	local randomface = require("random_face");
	randomface.RandomFace(e.self, eq);
end


function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("glances towards you, looking you up and down then continues about their duty. It is apparent to you that this guard does not wish to speak with you.");
	end
end