function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I do not wish to speak with your kind.  If you have business with the king attend to it now, " .. e.other:Race() .. ".");
	end
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Your bones will be crushed by the Kromzek of Kael Drakkel!");
	end
end