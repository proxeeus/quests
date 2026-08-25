function event_combat(e)
	if(e.joined) then
		local racesplural = require("races_plural");
		e.self:Say(string.format("Time to die %s.",racesplural.GetSingle(e.other:GetRace())));
	end
end
