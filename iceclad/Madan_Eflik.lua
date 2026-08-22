function event_combat(e)
	if(e.joined) then
		e.self:Say("Take this ya lily livered landlubber!");
	end
end

function event_slay(e)
	e.self:Say("Dead fools tell no tales.");
end
