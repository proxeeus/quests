function event_aggro(e)
	e.self:Say(
		(eq.ChooseRandom
			(
				string.format("Time to die, %s.", e.other:GetName()),
				"Your intolerable reputation insults all in this realm!",
				"Your foul deeds have earned my contempt!",
				"I shall rid the land of another infamous villain!",
				"Your actions and history are a personal affront to all I stand for!"
			)
		);
end

function event_death_complete()
	e.self:Say("My comrades will avenge my death.");
end