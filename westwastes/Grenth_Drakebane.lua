function event_death_complete(e)
    e.self:Say("Argh!  I shall be rewarded in the Kingdom of Brell for my victories over the children of Veeshan!");
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Ye be messin with the wrong dwarf!  I'll smash ye'r head in like a ripe marr cherry!");
	end
end

