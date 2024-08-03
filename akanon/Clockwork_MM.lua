function event_spawn(e)
	eq.set_timer("depop",70000);
end

function event_combat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
			e.self:Say("Click... Tick... City violation. Code 5150. This unit is authorized to execute punishment. Please stand still. Thank you.");
		end
	else
		eq.resume_timer("depop");
	end
end

function event_timer(e)
	eq.depop();
end

function event_death_complete(e)
	e.self:Say("Bzzzz... Click... This unit is terminally damaged. Destruction of city property is a violation of city code 22468. All units shall be notified of your offense...");
end
