function event_death_complete(e)
    e.self:Say("You will pay, and pay dearly, for this.  The Claws will exterminate you.");
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("You should not have dared!");
	end
end

