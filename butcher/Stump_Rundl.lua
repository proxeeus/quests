function event_combat(e)
	if(e.joined) then
		e.self:Say("Aha! Prepare to meet the greatest swordsman in Kaladim!");
	end
end

function event_death_complete(e)
	e.self:Say("Darn it! Just when I thought I was moving up in Miner's Guild 628.");
end

function event_slay(e)
	e.self:Say("What was that?! An attempt at humor? My skill was not meant to be wasted on jesters!");
end
