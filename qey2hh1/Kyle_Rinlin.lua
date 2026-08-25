function event_spawn(e)
	e.self:SetRunning(true);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("No time to talk!! I must be off. The grains of sand are falling and I must prove that we paladins from the Temple of Thunder are the quickest.");
	end
end

function event_combat(e)
	if(e.joined == true) then
		e.self:Say("Rodcet Nife!!  Give me strength to smite your foe!!");
	end
end

function event_death_complete(e)
	e.self:Say("Your name has been stricken from the book of the Prime Healer!!  I shall be avenged!");
end
