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
		e.self:Say(string.format("Hello, %s! My name is Rashik Hiccs adn I would like to welcome you to Qenos on behalf of all the guards. If you get into trouble, just find one of us and we will help you out.",e.other:GetName()));
	end
end
