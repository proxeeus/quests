function event_combat(e)
	if e.joined then
		e.self:Emote("charges ahead with a dreadful fury.");
	end
end

function event_death_complete(e)
	e.self:Emote("collapses and makes a deep impression in the ground.");
end
