function event_combat(e)

	local racesplural = require("races_plural");

	e.self:Say( eq.ChooseRandom( string.format("It's %s like you who have ruined your own lands. You'll not ruin mine!",racesplural.GetPlural(e.other:GetRace())), 
								 string.format("%s have no place in our realm!",racesplural.GetPlural(e.other:GetRace())),
								 string.format("%s like you are better left dead than alive!",racesplural.GetPlural(e.other:GetRace())),
								 string.format("Time to die %s.",racesplural.GetSingle(e.other:GetRace()))
								)
			   );

end

function event_say(e)
	if(e.message:findi("")) then
		e.self:Say(string.format("Hail, %s.  If you are not busy, we can always use help keeping the beetle population under control in front of the gates.  But be careful, we have had sightings of a large queen beetle out there.",e.other:GetName()));
	end
end


function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end