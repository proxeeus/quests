function event_combat(e)
	if(e.joined) then
		e.self:Say(eq.ChooseRandom(
									"Centurions!! Attack!!",
									"How dare you!"
								  ));
	end
end

function event_death_complete(e)
	e.self:Say(eq.ChooseRandom(
								"Aaarrghh!! The Deathfist shall hunt you down. My death will not go unnoticed.",
								"My comrades will avenge my death."
							  ));
end