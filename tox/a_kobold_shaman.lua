function event_combat(e)
	if(e.joined) then
		e.self:Say("Grrrrr. Bark. Bark. Grrrrr.");
	end
end

function event_death_complete(e)
	e.self:Emote("corpse crumples to the ground.");
end