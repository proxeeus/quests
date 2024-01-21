function event_combat(e)
	if(e.joined) then
		e.self:Shout("You shall not pass this point.");
	end
end

function event_death_complete(e)
	e.self:Shout("Progenitor, one has fallen, a replacement is needed.")
end

function event_slay(e)
	e.self:Say("As it is willed, none shall pass.");
end