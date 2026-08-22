function event_combat(e)
	if e.joined then
		e.self:Emote("outstretches its arms and aims to crush your skull.");
	end
end

function event_death_complete(e)
	e.self:Emote("collapses into a heap of grimy dirt.");
end
