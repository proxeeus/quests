function event_combat(e)
	if(e.joined) then
		local lines = {
			"scuttles from the shadows.",
			"charges as its multi-faceted eyes shimmer like fire.",
		};
		e.self:Emote(lines[math.random(#lines)]);
	end
end

function event_death_complete(e)
	e.self:Emote("oozes fiery blood across the ground.");
end
