
function event_combat(e)
	if(e.joined) then
		e.self:Say("HELP ME MINYUNS! DA POWA OB DA BOOK COMMANDS IT!");
	end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end
