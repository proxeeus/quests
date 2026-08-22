function event_combat(e)
	if(e.joined) then
		e.self:Say("Our slumber has been disturbed, the use of arcane tools is authorized.");
	end
end

function event_death_complete(e)
	e.self:Say("The arcane might has failed us, we are many and you are few, death is imminent.");
end
