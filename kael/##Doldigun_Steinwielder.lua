-- Doldigun Steinwielder
-- Loot version (Plate House / Ring #9);

function event_spawn(e)
	e.self:Say("Uhh, I think I'll be leaving now... Give my regards to Thurgadin.");
	e.self:SetRunning(true);
	e.self:MoveTo(1441, -839, -116, 385, true);
end

function event_waypoint_arrive(e)
	eq.signal(113553, 1);
	e.self:Depop();
end