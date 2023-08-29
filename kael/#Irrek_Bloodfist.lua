function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I long for the day when we might assault the temple of the Dragons.  We shall cover the land in a warm blanket of blood.");
	end
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Your bones will be crushed by the Kromzek of Kael Drakkel!");
	end
end