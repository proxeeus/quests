function event_death_complete(e)
    e.self:Say("Ungh.. I go now to join the spirits.");
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("I'll smash you with my savage fists!");
	end
end

