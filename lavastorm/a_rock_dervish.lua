function event_combat(e)
	if(e.joined) then
		e.self:Emote("twists into battle, gathering loose debris as it goes.");
	end
end

function event_death_complete(e)
	e.self:Emote("slows its spinning until it eventually disappears entirely.");
end
