function event_combat(e)

	if(e.joined == true)
		e.self:Say("None shall defile the realm of our master!");
	end
end

function event_slay(e)
	e.self:Say("Embrace our lord before your soul departs, and perhaps he shall grant you the boon of eternal life in his service!");
end

function event_death_complete(e)
	e.self:Say("Innoruuk, I have failed you!");
end