function event_waypoint_arrive(e)
	if(e.wp == 55 or e.wp == 117) then
		e.self:SetRunning(true);
	elseif(e.wp == 82) then
		e.self:SetRunning(false);
	end
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Oooohhh... Arghhh... Yooouuu sssshhhalll neeeveer ffffiiinnnd the paaawwww...");
	end
end

function event_death_complete(e)
	e.self:Say("Aaaatt laaasssssstttt! Opolla's cuuurrsssee is lifted!");
end