function event_combat(e)
	if (e.joined) then
		e.self:Say("Click..  Inferior being.  Red 5 shall exterminate.");
	end
end

function event_death_complete(e)
	e.self:Say("Scrap..  Red 5 shall salvage for parts.");
end