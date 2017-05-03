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
		e.self:Say(string.format("Hail. %s!  Good to see ya!  Welcome to Qeynos!  My name is Gehnus Torris.  If you are looking to do some trading. I would steer clear of that Tubal fellow.  He is from Highpass Hold and they are well known for taking advantage of travelers.",e.other:GetName()));
	end
end


function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end