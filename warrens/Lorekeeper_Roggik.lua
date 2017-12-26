function event_combat(e)
	e.self:Say("Grrrrr. Bark. Bark. Grrrrr.");
end

function event_death_complete(e)
	e.self:Emote("corpse crumples to the ground.");
end