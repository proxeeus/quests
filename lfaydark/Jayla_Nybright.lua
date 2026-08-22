function event_combat(e)
	if e.joined then
		e.self:Say("Come, sisters!! A fool to test our blades upon!!");
	end
end

function event_death_complete(e)
	e.self:Say("Unngh..  The dervish cutthroats will learn of this.");
end
