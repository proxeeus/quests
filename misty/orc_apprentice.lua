function event_combat(e)
	if(e.joined) then
		e.self:Say("You shall bleed!!  All hail the Deathfist!!");
	end
end

function event_death_complete(e)
	e.self:Say("Aaarrghh!!  The Deathfist shall hunt you down.  My death will not go unnoticed.");
end

function event_slay(e)
	e.self:Say("For the glory of the Deathfist Magistrate and all of Clan Deathfist!");
end
