function event_combat(e)
	if(e.joined) then
		e.self:Say(eq.ChooseRandom(
			"Prepare to bleed!!",
			string.format("Time to die %s.", e.other:GetName())));
	end
end

function event_death_complete(e)
	e.self:Say(eq.ChooseRandom(
		"The Wolves o' the North shall track ye down and avenge me death.",
		"My comrades will avenge my death."));
end
