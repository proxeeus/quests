function event_combat(e)
	if(e.joined) then
		e.self:Say("Let me release your soul.");
	end
end

function event_death_complete(e)
	e.self:Say("Your destiny lies at the hands of the Greenbloods.");
end
