function event_combat(e)
	if(e.joined) then
		random_say = math.random(100);
		if(random_say <= 30) then
			e.self:Say("Death!!  Death to all who oppose the Crushbone orcs!!");
		elseif(random_say <= 65) then
			e.self:Say("Hail, Emperor Crush!!");
		else
			e.self:Say("Fall before the might of Clan Crushbone!!");
		end
	end
end

function event_death_complete(e)
	e.self:Say("You shall have all the Crushbone orc legions on your tail for my death!!");
end
