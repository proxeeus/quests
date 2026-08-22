function event_combat(e)

	local racesplural = require("races_plural");

	if e.joined then
		e.self:Say( eq.ChooseRandom( string.format("It's %s like you who have ruined your own lands. You'll not ruin mine!",racesplural.GetPlural(e.other:GetRace())),
									 string.format("%s have no place in our realm!",racesplural.GetPlural(e.other:GetRace())),
									 string.format("%s like you are better left dead than alive!",racesplural.GetPlural(e.other:GetRace())),
									 string.format("Time to die %s.",racesplural.GetSingle(e.other:GetRace())),
									 "You have happened upon the territory of the dervish cutthroats.  Now, you pay the price!"
									)
				   );
	end

end

function event_spawn(e)
	local randomface = require("random_face");
	randomface.RandomFace(e.self, eq);
end


function event_death_complete(e)
	e.self:Say( eq.ChooseRandom( "My comrades will avenge my death.",
								 "Aargh!!  Watch your back, fool.  The dervish cutthroats are everywh.. Ungh.."
								)
			   );
end