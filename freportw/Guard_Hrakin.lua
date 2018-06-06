function event_combat(e)
	local say = eq.ChooseRandom(true, false);
	if(say == true) then
		e.self:Say(eq.ChooseRandom(
									"Die, dog!!",
									"That's it, swine! You're outta here!",
									string.format("Time to die, %s.", e.other:GetName())
								  ));
	else
		e.self:Emote(string.format("smacks the flat of his blade against the palm of his hand and says, 'You want a taste of this, %s?!!",e.other:GetName()));
	end
end

function event_death(e)
	e.self:Say(eq.ChooseRandom(
								"My comrades will avenge my death.",
								"Your name shall be added to the most wanted list of the Freeport Militia!!"
							   ));
end

function event_slay(e)
	e.self:Say("Let your death be a warning to all who dare oppose the Freeport Militia!");
end