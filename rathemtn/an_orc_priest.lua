function event_combat(e)
	e.self:Say("Orc stomp, orc kill - orc weapons, your blood will spill.");
end

function event_death_complete(e)
	e.self:Say("Argh! Clan Deathfist will spill blood for my death!");
end