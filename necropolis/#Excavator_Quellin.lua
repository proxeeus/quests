function event_combat(e)
	if(e.joined) then
		e.self:Emote("unleashes a battle cry as he closes in.");
	end
end

function event_death_complete(e)
	e.self:Emote("settles to the ground, his chin slumping into his chest.");
end
