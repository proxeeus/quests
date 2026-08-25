function event_combat(e)
	if e.joined then
		e.self:Say("Prepare to die!");
	end
end

function event_slay(e)
	e.self:Say("Hardly a worthy adversary. A member of the Indigo Brotherhood deserves a much better opponent.");
end

function event_death_complete(e)
	e.self:Say("Start digging your grave. The Indigo Brotherhood shall find you.");
end
