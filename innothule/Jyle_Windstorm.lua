function event_combat(e)
	if (e.joined) then
		e.self:Say(eq.ChooseRandom(
			"Let no evil beings stand in the way of the righteousness of the Paladins of Tunare!",
			"Run! I have need of the hunt!"
		));
	end
end
