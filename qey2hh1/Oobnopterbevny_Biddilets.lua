function event_combat(e)
	if(e.joined == true) then
		e.self:Say("Tra la la.  In the name of the Dark Reflection, you will die now.");
	end
end

function event_death_complete(e)
	e.self:Say("Tra la . . . Oh . . . Rats . . .");
end

function event_slay(e)
	e.self:Say("Ha haa!  Told you!");
end
