function event_spawn(e)
	 eq.set_timer("appe", 1000);
end

function event_timer(e)
	eq.stop_timer(e.timer);
	e.self:SetAppearance(3);
end