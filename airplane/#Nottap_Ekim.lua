function event_spawn(e)
	eq.set_timer("keeper",3600000);
end

function event_timer(e)
	if(e.timer == "keeper") then
		eq.spawn2(71075,0,0,-672,441,152,390);
		eq.depop();
	end
end