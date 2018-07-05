function event_combat(e)
	if(e.joined) then
		e.self:Say("In the name of the Rainkeeper, I strike at thee!!");
	end
end

function event_death_complete(e)
	e.self:Say("Karana shall guide the Knights of Thunder to avenge the death of one of his flock.");
end