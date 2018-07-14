function event_say(e)
	if(e.message:findi("mistress anna")) then
		e.self:Say("Mistress!  Aptly named, that one.  You are speaking of the Highpass hussy.  That is what everyone calls her, at least behind her back, that is.  Just as Highpass, she is beautiful and frequently traveled.  I have heard rumors that Carson has been seeing her, but how can that be true?  He has Lady McCabe.  What else does he need?");
	end
end

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