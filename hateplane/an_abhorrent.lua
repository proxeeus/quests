function event_combat(e)

	if(e.joined == true)
		e.self:Say("Hold still, this will only hurt for an eternity!");
	end
	
end

function event_slay(e)
	e.self:Say("Don't you just hate when that happens?");
end
