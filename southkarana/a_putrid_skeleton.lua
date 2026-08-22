function event_combat(e)
	if(e.joined == true) then
		e.self:Say( eq.ChooseRandom( ("Come.... come and join Tolon!"),
									 ("Never fear.... Smyth issss...Here!"),
									 ("Die, like the fool you are!")
									 ) );
	end
end

function event_slay(e)
	e.self:Say("The Lord of Disease welcomes you!");
end

function event_death_complete(e)
	e.self:Say("Bertoxxuloussss.... shall find you.");
end