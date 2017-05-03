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
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello, %s.  Shh..  Come here.  I am worried.  I am new to this job but already I get the feeling something is wrong.  I have seen one of the lieutenants talking to a suspected necromancer.  It appeared they were old friends.  Something dark is growing in Qeynos.  Be careful!",e.other:GetName()));
	end
end
