function event_combat(e)
	if e.joined then
		e.self:Emote("rushes forward as dirt sprays off its limbs.");
	end
end

function event_death_complete(e)
	e.self:Emote("crumbles into broken earth.");
end
