function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Go ahead Murdrick, what's this plan of yours?");
		eq.set_timer("dialogue7", 5000);
	end
end

function event_timer(e)
	if(e.timer == "dialogue7") then
		eq.stop_timer(e.timer);
		eq.signal(118061, 4)		-- Prompts an answer from Murdrick
	end
end