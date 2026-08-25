function event_combat(e)
	if(e.joined == true) then
		e.self:Say("AARRGHHH!!!!!  Into the fray come the Wolves of the North.  Cut you down, I will!!");
	end
end

function event_death_complete(e)
	e.self:Say("You fool!!  My brothers and sisters of the Wolves of the North shall hunt you down!  You.. are.. through..");
end
