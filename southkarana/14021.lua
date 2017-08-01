function event_combat(e)
	if(e.joined == true) then
		e.self:Say("Come and join Barger.");
	end
end

function event_death_complete(e)
	e.self:Say("Bertoxxuloussss.... shall find you.");
end