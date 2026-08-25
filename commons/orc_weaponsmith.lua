function event_combat(e)
	if(e.joined) then
		e.self:Say("Centurions!! Attack!!");
	end
end

function event_death_complete(e)
	e.self:Say("Aaarrghh!! The Deathfist shall hunt you down. My death will not go unnoticed.");
end
