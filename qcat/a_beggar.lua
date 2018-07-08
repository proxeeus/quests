function event_combat(e)
	if(e.joined) then
		local racesplural = require("races_plural");

		e.self:Say( eq.ChooseRandom( string.format("It's %s like you who have ruined your own lands. You'll not ruin mine!",racesplural.GetPlural(e.other:GetRace())), 
									 string.format("%s have no place in our realm!",racesplural.GetPlural(e.other:GetRace())),
									 string.format("%s like you are better left dead than alive!",racesplural.GetPlural(e.other:GetRace())),
									 string.format("Time to die %s.",racesplural.GetSingle(e.other:GetRace()))
									)
				   );
	end

end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Guards! Guards! Help me!!");
		e.self:Say("Guards! Guards! Help me!!");
	end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end