function event_combat(e)
	if (e.joined) then
		e.self:Say("Die like a fool you are!");
	end
end

function event_death_complete(e)
	e.self:Say("Bertoxxuloussss.. shall find you.");
end