function event_combat(e)
	if(e.joined == true) then
		e.self:Say("And to think I thought it was safe to live in the plains.");
	end
end

function event_death(e)
	e.self:Say("Karana shall guide the Knights of Thunder to avenge the death of one of his flock.");
end
