function event_combat(e)

	local racesplural = require("races_plural");

	e.self:Say( eq.ChooseRandom( string.format("It's %s like you who have ruined your own lands. You'll not ruin mine!",racesplural.GetPlural(e.other:GetRace())), 
								 string.format("%s have no place in our realm!",racesplural.GetPlural(e.other:GetRace())),
								 string.format("%s like you are better left dead than alive!",racesplural.GetPlural(e.other:GetRace())),
								 string.format("Time to die %s.",racesplural.GetSingle(e.other:GetRace()))
								)
			   );

end
function event_waypoint_arrive(e)
	if(e.wp == 18) then
		e.self:Say("Have you noticed anything strange about Commander Bayle lately? I saw him talking to that trouble-making Irontoe the other day and one night late last week, when I was on patrol, I saw him sneaking into Crow's");
		eq.signal(2094,1);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s!  I am sorry but I do not have time to chat, as I must get back to my patrol.  May the Prme Healer walk with you!",e.other:GetName()));
	end
end


function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end