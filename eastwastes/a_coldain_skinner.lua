function event_combat(e)

	local racesplural = require("races_plural");

	if(e.joined) then
		e.self:Say( eq.ChooseRandom( string.format("It's %s like you who have ruined your own lands. You'll not ruin mine!",racesplural.GetPlural(e.other:GetRace())),
									 string.format("%s have no place in our realm!",racesplural.GetPlural(e.other:GetRace())),
									 string.format("%s like you are better left dead than alive!",racesplural.GetPlural(e.other:GetRace())),
									 string.format("Time to die %s.",racesplural.GetSingle(e.other:GetRace())),
									 "Your blood in the snow will leave a deep stain!  A reminder to all not to cross the Coldain!"
									)
				   );
	end

end

function event_spawn(e)
	local randomface = require("random_face");
	randomface.RandomFace(e.self, eq);
end


function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end