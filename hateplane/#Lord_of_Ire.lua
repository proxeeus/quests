function event_combat(e)

	if(e.joined == true) then
		e.self:Say("Uninvited guests to our master's home must be shown the way out!");
	end
	
end

function event_slay(e)
	e.self:Say("If you are lucky, you will stay dead. If you are not lucky, you will become as we are!");
end

function event_death_complete(e)
	e.self:Say("Perhaps this death will release my soul from this accursed place.");
end