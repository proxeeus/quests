function event_combat(e)
	if(e.joined) then
		e.self:Emote("flies into a battle as strong winds blows all around.");
	end
end

function event_death_complete(e)
	e.self:Emote("unleashes a low rumbling moan.");
end
