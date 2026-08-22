function event_combat(e)
	if(e.joined) then
		e.self:Say(eq.ChooseRandom(
			"Die, like a motherless gnoll!",
			"For the glory of Kaladim, have at thee!!"
		));
	end
end

function event_death_complete(e)
	e.self:Say(eq.ChooseRandom(
		"My comrades will avenge my death.",
		"My brothers of the Stormguard shall avenge me!!  Your days are numbered!"
	));
end

function event_slay(e)
	e.self:Say("For the glory of Kaladim!! You are no more.");
end
