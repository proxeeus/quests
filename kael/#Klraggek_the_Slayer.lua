function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("stares down at you and tightens his sword grip.");
	end
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Your bones will be crushed by the Kromzek of Kael Drakkel!");
	end
end