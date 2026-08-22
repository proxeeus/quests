function event_combat(e)
	if(e.joined) then
		e.self:Say("One has been engaged, it will exterminate the intruders.");
	end
end

function event_death_complete(e)
	e.self:Say("Death is meaningless to one such as this, there will be more.");
end
