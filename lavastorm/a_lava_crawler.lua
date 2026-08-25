function event_combat(e)
	if(e.joined) then
		e.self:Emote("snarls and attacks.");
	end
end

function event_death_complete(e)
	e.self:Emote("shudders and collapses.");
end
