function event_combat(e)

	if(e.joined == true)
		e.self:Say("I shall slow your heart and shatter your soul!");
	end
	
end

function event_slay(e)
	e.self:Say("Another soul one step closer to our master's touch!");
end

function event_death_complete(e)
	e.self:Say("Careful which paths you follow in life, mortals! Fill yourself with hate and you will become a tool of Innoruuk.");
end