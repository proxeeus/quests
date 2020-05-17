function event_spawn(e)
	eq.set_timer("dialogue", eq.ChooseRandom(3000, 4500, 2000));
end

function event_timer(e)
	if(e.timer == "dialogue") then
		eq.stop_timer(e.timer);
		e.self:Say("Regardless of allegiance, no outlanders are welcome here now!");
	end
end