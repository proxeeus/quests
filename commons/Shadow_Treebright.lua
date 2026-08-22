function event_combat(e)
	if(e.joined) then
		e.self:Say("There must be hundreds of interlopers in this place of nature, and this one has just crossed paths with terrible fate!");
	end
end

function event_death_complete(e)
	e.self:Say("Aaaaagh, not like this!");
end
