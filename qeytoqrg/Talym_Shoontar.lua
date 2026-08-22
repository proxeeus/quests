function event_waypoint_arrive(e)
	if(e.wp == 1 or e.wp == 6) then
		e.self:SetRunning(true);
	elseif(e.wp == 4 or e.wp == 7) then
		e.self:SetRunning(false);
	end
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("That's it, swine! You're outta here!");
	end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end
