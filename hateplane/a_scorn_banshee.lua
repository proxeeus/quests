function event_combat(e)

	if(e.joined == true) then
		e.self:Say("You are almost beneath notice, but our master commands your death.");
	end
	
end

function event_slay(e)
	e.self:Emote("snorts in contempt, not at all surprised at the ease of her victory.");
end

function event_death_complete(e)
	e.self:Say("blinks in confusion, obviously surprised that she has met her end at the hands of mere mortals.");
end