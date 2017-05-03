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
		e.self:Say(string.format("Heh?  %s, huh?  What do you want?  Can't you see I am a busy man, guarding and protecting you weaklings..  er.. citizens?  You better just move along before something happens to you!",e.other:GetName()));
	end
end
