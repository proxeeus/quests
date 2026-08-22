function event_combat(e)
	if e.joined then
		e.self:Emote("grinds as it unfurls its stone wings and attacks.");
	end
end

function event_death_complete(e)
	e.self:Emote("cracks and fractures into still jagged stone.");
end
