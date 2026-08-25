function event_spawn(e)
	local randomface = require("random_face");
	randomface.RandomFace(e.self, eq);
end


function event_combat(e)
	e.self:Say("Do not underestimate the might of Mistmoore!");
end

function event_death_complete(e)
	e.self:Say("With my last breath, I call upon the vengeance of House Mistmoore!  Stalk the filth that strikes against our house and leave their organs strewn about the Lesser Faydark!");
	eq.spawn2(59129,0,0,-167,88,-221,113); -- NPC: a_greater_spirit
end

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("How dare you speak to me, you impudent sack of nauseating refuse!  For this outrage of insubordination I call forth the vengeance of House Mistmore!  You now have little time left to live.  Enjoy it.");
	end
end