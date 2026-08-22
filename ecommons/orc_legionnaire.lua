function event_combat(e)
	e.self:Say(eq.ChooseRandom(
		"Centurions!! Attack!!",
		"For the glory of the Deathfist Magistrate, your blood shall run!!"
	));
end

function event_death_complete(e)
	e.self:Say("Aaarrghh!! The Deathfist shall hunt you down. My death will not go unnoticed.");
end