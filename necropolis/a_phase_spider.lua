function event_combat(e)
	if(e.joined) then
		e.self:Emote("gnashes its translucent mandibles.");
	end
end

function event_death_complete(e)
	e.self:Emote("is motionless, trapped in this reality.");
end
