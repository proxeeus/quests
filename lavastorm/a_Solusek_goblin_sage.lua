function event_combat(e)
	if(e.joined) then
		e.self:Emote("charges, leaving a trail of burning footprints across the ground.");
	end
end

function event_death_complete(e)
	e.self:Emote("collapses and begins to crumble into glowing embers.");
end
