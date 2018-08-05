function event_combat(e)
	if(e.joined) then
		e.self:Say(eq.ChooseRandom("Grrrrr. Bark. Bark. Grrrrr.", "Your foul deeds have earned my contempt.", "I shall rid the land of another infamous villain."));
	end
end

function event_death_complete(e)
	e.self:Emote("'s corpse crumples to the ground.");
end