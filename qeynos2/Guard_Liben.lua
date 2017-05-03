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
		e.self:Say(string.format("Hello there. %s.  Guard Liben at your service.  You can walk the streets of Qeynos and feel safe knowing that we guards are here to protect you.  Just be careful not to fall in with the [wrong crowd].",e.other:GetName()));
	elseif(e.message:findi("wrong crowd")) then
		e.self:Say("Oh you know. the Circle.  The Circle of Unseen Hands is what they call themselves.  They are a bunch of thieves and murderers.  Just stay clear of them. if you know what's good for you.");
	end
end
