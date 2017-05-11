function event_combat(e)
	local racesplural = require("races_plural");

	e.self:Say("Leave my lands or die!! So says Husam the Great!!");
	s.self:Say(string.format("%s like you are better left dead than alive!",racesplural.GetPlural(e.other:GetRace())));
end