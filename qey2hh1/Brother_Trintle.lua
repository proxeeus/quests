function event_combat(e)
	if(e.joined == true) then
		e.self:Say("Prime Healer!!  Guide me to victory!!");
	end
end

function event_death_complete(e)
	e.self:Say("Your name has been stricken from the book of the Prime Healer!!  I shall be avenged!");
end
