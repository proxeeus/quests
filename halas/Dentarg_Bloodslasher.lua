function event_spawn(e)
	e.self:Shout("Enuf of dis ! Witness da power of a servant of da Coven !");
	eq.set_timer("depop",900000);
end

function event_death_complete(e)
	e.self:Say("Da...Cov...da Coven...shall find you!");
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end