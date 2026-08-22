function event_combat(e)
	if (e.joined) then
		e.self:Say("Come here and fill my belly with your tasty flesh.");
	end
end

function event_death_complete(e)
	e.self:Say("My Crakneks will make you bleed...");
end
