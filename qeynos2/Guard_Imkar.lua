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
		e.self:Say(string.format("Hello, %s.  My name is Imkar and I am kind of new at this job but I can give you some advice.  Be careful here in Qeynos.  There are many [dark forces] at work here that are best left undisturbed.",e.other:GetName()));
	elseif(e.message:findi("dark force")) then
		e.self:Say("I really don't know yet.  I just know that chills shoot up and down my spine when I pass certain places on my patrol.  My mother was a gypsy and told me I had the 'gift of sense.'  I think the chills are part of that gift.  Just be careful.  Especially near the entrances to the aqueducts below the city.");
	end
end


function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end