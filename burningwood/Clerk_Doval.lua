function event_death_complete(e)
	e.self:Say("All Iksar residents.. shall learn.. of my demise. Ungghh!!");
	eq.signal(87101,1);
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("I will slay all in the name of Overking Bethezid! He shall deliver power to me.");
	end
end