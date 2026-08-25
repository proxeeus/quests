function event_combat(e)
	if(e.joined) then
		e.self:Say(eq.ChooseRandom(
			"How foolish of you to attack me! Prepare to die!",
			"You should have considered who you were dealing with before making such a mistake."
		));
	end
end
