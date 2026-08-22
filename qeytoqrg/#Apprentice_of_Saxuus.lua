function event_combat(e)
	if(e.joined) then
		e.self:Say("I abhor violence, but if you insist I will send you to Karana.");
	end
end

function event_slay(e)
	e.self:Say("I'm sorry that it was necessary to kill you, but you left me little choice.");
end
