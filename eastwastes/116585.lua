function event_waypoint_arrive(e)
	if(e.wp == 2) then
		eq.pause(0);
	end
end

function event_signal(e)
	if(e.signal == 1) then
		eq.start(247);
		e.self:SetRunning(true);
	elseif(e.signal == 2) then
		eq.set_timer("cheer", 1);
	elseif(e.signal == 3) then
		e.self:ResumeWandering();
	end
end

function event_timer(e)
	if(e.timer == "cheer") then
		eq.stop_timer(e.timer);
		e.self:DoAnim(27);
	end
end