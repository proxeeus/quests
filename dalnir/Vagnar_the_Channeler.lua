function event_spawn(e)
	e.self:SetRunning(true);
	eq.set_timer("depop", 3 * 1000);
	e.self:Shout("Go to where the pines have been smashed. Must reach great heights!");
	e.self:MoveTo(-928,174,-80,0,true);
end

function event_timer(e)
	if(e.timer=="depop") then
		eq.depop();
	end
end