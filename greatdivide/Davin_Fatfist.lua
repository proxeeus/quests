function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Well, we are alive, but I'd hardly say we're well... We have heard of the death of Rodrick, and the Dain is calling on all citizens of Thurgadin to flush out any opposition to the throne. If we're tied to your dealings with the Kromrif we'll be sent to the bottom of the well for sure.");
		eq.set_timer("dialogue3", 10000);
	elseif(e.signal == 2) then
		e.self:Say("Sounds good boss, but how do you plan on poisoning him?");
		eq.set_timer("dialogue10", 5000);
	end

end

function event_timer(e)
	if(e.timer == "dialogue3") then
		eq.stop_timer(e.timer);
		eq.signal(118061, 2)	-- Prompts an answer from Murdrik
	elseif(e.timer == "dialogue10") then
		eq.stop_timer(e.timer);
		eq.signal(118061, 5);		-- Prompts an answer from Murdrik
	end
end