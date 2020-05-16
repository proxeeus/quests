local spawn_move = false;

function event_spawn(e)
-- goto 1036, -3408 148, 119
	e.self:MoveTo(1036, -3408, 148, 119, true);
	spawn_move = true;
end

function event_waypoint_arrive(e)
	if(spawn_move) then
		eq.set_timer("rodrick", 30000);
	end
end

function event_timer(e)
	if(e.timer == "rodrick") then
		eq.stop_timer(e.timer);
		eq.spawn2(eq.ChooseRandom(116003,116140,116141),0,0,1056,-3406,145,390);
		eq.set_timer("leave", 300000);
	elseif(e.timer == "leave") then
		eq.stop_timer(e.timer);
		eq.set_timer("depop", 10000);
		eq.depop_all(116003);
		eq.depop_all(116140);
		eq.depop_all(116141);
		e.self:MoveTo(792, -4116, 146, 291, true);
	elseif(e.timer == "depop") then
		eq.stop_timer(e.timer);
		e.self:Depop(true);
	end
end