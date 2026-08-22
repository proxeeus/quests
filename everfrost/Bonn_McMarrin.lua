function event_combat(e)
	if(e.joined) then
		e.self:Say(eq.ChooseRandom(
			"Prepare to bleed!!",
			"For the glory o' the Wolves!!"));
	end
end

function event_death_complete(e)
	e.self:Say("The Wolves o' the North shall track ye down and avenge me death.");
end

function event_slay(e)
	e.self:Say("Fer Halas!! One more victory fer the Wolves o' the North!!");
end
