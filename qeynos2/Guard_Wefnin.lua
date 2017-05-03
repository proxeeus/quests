function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s.  If you are looking for the way to South Qeynos, the passage through the city wall south of the cobbler's shop leads to the Merchant's Square near the Clock of Ak'Anon.",e.other:GetName()));
	end
end

function event_combat(e)

	local racesplural = require("races_plural");

	e.self:Say( eq.ChooseRandom( string.format("It's %s like you who have ruined your own lands. You'll not ruin mine!",racesplural.GetPlural(e.other:GetRace())), 
								 string.format("%s have no place in our realm!",racesplural.GetPlural(e.other:GetRace())),
								 string.format("%s like you are better left dead than alive!",racesplural.GetPlural(e.other:GetRace())),
								 string.format("Time to die %s.",racesplural.GetSingle(e.other:GetRace()))
								)
			   );

end