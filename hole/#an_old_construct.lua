function event_combat(e)
	if e.joined then
		e.self:Emote("creates a monstrous shadow as it approaches.");
	end
end

function event_death_complete(e)
	e.self:Emote("fills the air with a hollow thud as it falls.");
end
