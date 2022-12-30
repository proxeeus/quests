function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You are truly a blight upon the planet. Here you are in this, the most holy of lands, and you DARE speak to me as if you were some sort of equal! We need to wipe the world clean, it is for the children of Veeshan, no others! I do not know what the Claws are thinking, our Mother would not approve of your kind, this much I know.");
	end
end

function event_death_complete(e)
	e.self:Say("How? How did you defeat me? Perhaps the Claws were right? Mother Veeshan, forgive my foolishness!");
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Why do you even bother to challenge our power?  You can not win.");
	end
end

