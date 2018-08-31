function event_slay(e)
	e.self:Say("Tone deaf fool, you have no ear for rhythm, and deserve this death.");
end

function event_death_complete(e)
	e.self:Say("The dance is over, for now.");
end