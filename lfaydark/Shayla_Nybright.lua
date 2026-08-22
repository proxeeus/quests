function event_combat(e)
	if e.joined then
		e.self:Say("Please run.  I do not wish to hurt you.");
	end
end

function event_death_complete(e)
	e.self:Say("Oooh..  I am sorry we had to battle.  I am not like my sisters.  I only wanted to live in peace..");
end
