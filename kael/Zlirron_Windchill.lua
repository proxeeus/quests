function event_spawn(e)
	e.self:MoveTo(1179, -840, -126, 128, true);
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Your bones will be crushed by the Kromrif of Kael Drakkel!");
	end
end

function event_death_complete(e)
	eq.signal(113553, 5);	-- signal Plate House master to increment kill count
end
