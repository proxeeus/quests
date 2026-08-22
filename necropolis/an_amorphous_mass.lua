function event_combat(e)
	if(e.joined) then
		e.self:Emote("pulsates, polyps questing for prey.");
	end
end

function event_death_complete(e)
	e.self:Emote("is not as dead as you think.");
end

function event_slay(e)
	e.self:Emote("seems to have grown a bit larger.");
end
