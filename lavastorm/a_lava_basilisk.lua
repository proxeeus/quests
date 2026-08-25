function event_combat(e)
	if(e.joined) then
		local lines = {
			"narrows its eyes which glow with an inner heat.",
			"opens its jaws and scuttles forward.",
		};
		e.self:Emote(lines[math.random(#lines)]);
	end
end

function event_death_complete(e)
	local lines = {
		"falls and begins to smolder.",
		"sinks to the ground, its scales dripping with rivulets of blood.",
	};
	e.self:Emote(lines[math.random(#lines)]);
end
