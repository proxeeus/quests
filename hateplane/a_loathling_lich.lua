function event_combat(e)

	if(e.joined == true) then
		e.self:Say("Die!");
	end
	
end

function event_slay(e)
	e.self:Say("Die!");
end
