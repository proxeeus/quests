function event_combat(e)
	if(e.joined) then
		e.self:Emote("growls and lunges at you!");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("sniffs at you and wags its tail.");
	end
end