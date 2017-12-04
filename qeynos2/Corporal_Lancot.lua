function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Greetings, %s!  Welcome to the fine city of Qeynos! If you wish to join our fight against the evil gnolls of Blackburrow, be sure to talk to Captain Tillin in the Hall of Steel.",e.other:GetName()));
	end
end

function event_combat(e)

	local racesplural = require("races_plural");

	e.self:Say( eq.ChooseRandom( string.format("It's %s like you who have ruined your own lands. You'll not ruin mine!",racesplural.GetPlural(e.other:GetRace())), 
								 string.format("%s have no place in our realm!",racesplural.GetPlural(e.other:GetRace())),
								 string.format("%s like you are better left dead than alive!",racesplural.GetPlural(e.other:GetRace())),
								 string.format("Time to die %s.",racesplural.GetSingle(e.other:GetRace())),
								"Halt! You are an enemy of the people of Qeynos! Stop in the name of Antonius Bayle and prepare for punishment!"
								)
			   );

end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end
