function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("We all saw what happened when Rodrick agreed to help you. I, for one, am none too eager to take on these new friends of the Dain.");
		eq.set_timer("dialogue5", 5000);
	elseif(e.signal == 2) then
		eq.set_timer("dialogue12", 5000);
	elseif(e.signal == 3) then
		e.self:Say("Consider it done. Be sure to watch yourself Murd, the Dain's gotta be suspicious of ya, being Rodrick's brother and all. And those outlander friends of his are dangerous, chopped down the Ry`Gorr chief like he was nothin!");
		eq.signal(118061, 7);		-- end cutscene signal
	end
end

function event_timer(e)
	if(e.timer == "dialogue5") then
		eq.stop_timer(e.timer);
		eq.signal(118061,3);		-- Prompts an answer from Murdrick
	elseif(e.timer == "dialogue12") then
		eq.stop_timer(e.timer);
		e.self:DoAnim(54);
		e.self:Emote("chuckles, 'Once again, Murdrick, you've put us at ease in the middle of a treacherous predicament. I will volunteer to brew the drink.'");
		eq.signal(118061, 6);		-- Prompts an answer from Murdrick
	end
end