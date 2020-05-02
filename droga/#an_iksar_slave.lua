-- This an_iksar_slave is the Shaman Cudgel version

function event_combat(e)

	local racesplural = require("races_plural");

	e.self:Say( eq.ChooseRandom( string.format("It's %s like you who have ruined your own lands. You'll not ruin mine!",racesplural.GetPlural(e.other:GetRace())), 
								 string.format("%s have no place in our realm!",racesplural.GetPlural(e.other:GetRace())),
								 string.format("%s like you are better left dead than alive!",racesplural.GetPlural(e.other:GetRace())),
								 string.format("Time to die %s.",racesplural.GetSingle(e.other:GetRace()))
								)
			   );

end

function event_spawn(e)
	local randomface = require("random_face");
	randomface.RandomFace(e.self, eq);
end


function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("peers up at you. His face is covered with grime and he shows scars from goblin whips. He shakes his head and goes back to his thoughts.");
	elseif(e.message:findi("digalis")) then
		e.self:Say("It has been a long time since I have been asked that. I am Digalis, mystic of Cabilis.");
	end
end
