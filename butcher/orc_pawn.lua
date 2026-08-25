function event_combat(e)
	if(e.joined) then
		e.self:Say("Centurions!!  Legionnaires!!  Come join the fight!");
	end
end

function event_death(e)
	e.self:Say("You shall have all the Crushbone orc legions on your tail for my death!");
end
