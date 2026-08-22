function event_combat(e)
	if e.joined then
		e.self:Emote("makes the ground shake with deadly intent.");
	end
end

function event_death_complete(e)
	e.self:Emote("cracks and splinters into massive sheets of ore.");
end
