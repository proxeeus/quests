function event_spawn(e)
	eq.disable_spawn2(151562);
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Broon will crush you like little pumpkin. Bwahaha!!");
	end
end

function event_death_complete(e)
	e.self:Say("ARGH!! You will pay, tiny thing!! My big brother Droon will make you dead! And if pap Proon gets you.. argh.. you will stain on his feets.. argh.");
	eq.enable_spawn2(151562);
end
