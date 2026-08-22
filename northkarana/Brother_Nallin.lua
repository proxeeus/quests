function event_combat(e)
	if(e.joined == true) then
		e.self:Say("Rodcet Nife!!  Give me strength to smite your foe!!");
	end
end

function event_death_complete(e)
	e.self:Say("Your name has been stricken from the book of the Prime Healer!!  I shall be avenged!");
end

function event_slay(e)
	e.self:Say("A pity...  Such a waste of a life.");
end
