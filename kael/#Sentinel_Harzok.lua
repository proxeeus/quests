function event_combat(e)
	if(e.joined) then
		e.self:Say("Your bones will be crushed by the Kromzek of Kael Drakkel!");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("watches you but does not say a word.");
	end
end