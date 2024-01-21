function event_combat(e)
	if(e.joined) then
		e.self:Say("This one has been assaulted, it goes now to eliminate its enemies.");
	end
end

function event_death_complete(e)
	e.self:Say("A new one has been slain Progenitor, a replacement is needed.")
end
