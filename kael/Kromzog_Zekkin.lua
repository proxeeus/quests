function event_death_complete(e)
	eq.spawn2(113471, 0, 0, 1069, -749, -126, 127);	-- Zlirron_Windchill
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Your bones will be crushed by the Kromrif of Kael Drakkel!");
	end
end
