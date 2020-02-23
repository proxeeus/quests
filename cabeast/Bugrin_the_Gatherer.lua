function event_spawn(e) 
	e.self:Say("You will never take me alive!!");
	e.self:SetRunning(true);
	e.self:MoveTo(-351, 1125, 3, 410, true);
end

function event_death_complete(e) 
	e.self:Say("hisss.. You will never stop the.. Radiant.. Green..");
end

function event_waypoint_arrive(e)
	e.self:Depop();
end