function event_spawn(e)
	local randomface = require("random_face");
	randomface.RandomFace(e.self, eq);
end


function event_combat(e)
	if(e.joined) then
		e.self:Emote("performs an acrobatic tumble and unsheathes his foil without pause. 'Short, stout and deadly am I. Stand and deliver!'");
	end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end