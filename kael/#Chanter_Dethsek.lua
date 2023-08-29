function event_combat(e)
	if(e.joined) then
		e.self:Say("Your bones will be crushed by the Kromrif of Kael Drakkel!");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("'s eyes glow red as he looks down at you.");
	end
end