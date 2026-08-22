function event_combat(e)
	if(e.joined) then
		e.self:Emote("lunges, baring its fang.");
	end
end

function event_death_complete(e)
	e.self:Emote("snarls and collapses.");
end
