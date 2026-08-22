function event_spawn(e)
	e.self:SetRunning(true);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("No time to talk!! I must be on my way. I am in a race with the paladins from the Temple of Life.");
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
