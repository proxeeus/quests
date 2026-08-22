function event_combat(e)
	if(e.joined) then
		e.self:Emote("clicks and hisses in rage.");
	end
end

function event_death_complete(e)
	e.self:Emote("looks up at you and squeals pitifully.");
end
