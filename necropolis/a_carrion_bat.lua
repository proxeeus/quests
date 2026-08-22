function event_combat(e)
	if(e.joined) then
		e.self:Emote("has decided to feed on live meat.  Yours.");
	end
end

function event_death_complete(e)
	e.self:Emote("flaps its huge wings one last time, then is still.");
end
