function event_death_complete(e)
	eq.spawn2(113492, 0, 0, 1130.3, -933.2, -125.6, 253.6);	-- Vinric_Thunderclap 
end


function event_combat(e)
	if(e.joined) then
		e.self:Say("Your bones will be crushed by the Kromrif of Kael Drakkel!");
	end
end