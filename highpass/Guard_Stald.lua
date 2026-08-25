function event_combat(e)
	if(e.joined) then
		e.self:Say(
			(eq.ChooseRandom(string.format("Time to die, %s.", e.other:GetName()),
					"Your intolerable reputation insults all in this realm!",
					"Your foul deeds have earned my contempt!",
					"I shall rid the land of another infamous villain!",
					"Your actions and history are a personal affront to all I stand for!")));
	end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end

function event_spawn(e)
	e.self:Shout("To arms! Fend off the intruders and halt their attempts to proceed any further!");
end