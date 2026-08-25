function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Blast!! Another one to be tested!! My work is never done.");
	end
end