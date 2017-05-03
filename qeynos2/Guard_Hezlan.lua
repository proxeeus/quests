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
		e.self:Say(string.format("Hello. %s.  My name is Hezlan Nur and I am a member of the Qeynos Guard, serving the will of Antonius Bayle.  Anything or anyone trying to get into Qeynos has to go through me. first.  Heh!  I sure love it when those dirty Sabertooths try, though!  Nothing is as gratifying as the death wail of a gnoll.",e.other:GetName()));
	end
end

function event_signal(e)
		e.self:Say("It isn't safe to be asking that kind of question. I just mind my business and do my job. You would, too, if you knew what was good for you.");
end
