function event_combat(e)
	if(e.joined) then
		e.self:Emote("scuttles from the shadows.");
	end
end

function event_death_complete(e)
	e.self:Emote("falls in a heap and continues dripping poison from its fangs.");
end
