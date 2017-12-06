function event_combat(e)
	e.self:Say(eq.ChooseRandom("Centurions!! Attack!!", "Centurions!! To my side."));
end

function event_death_complete(e)
	e.self:Say("Aaarrghh!! The Deathfist shall hunt you down. My death will not go unnoticed.");
end
