function event_spawn(e)
	e.self:MoveTo(1179, -840, -126, 128, true);
end

function event_death_complete(e)
	eq.spawn2(113528, 0, 0, 1069, -749, -126, 127);	-- Valorankt_Zekkin
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Your bones will be crushed by the Kromrif of Kael Drakkel!");
	end
end