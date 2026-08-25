function event_combat(e)
	if(e.joined) then
		e.self:Say("For the defense of Kelethin!!");
	elseif not e.joined then
		e.self:Say("For the protection of all Fier'Dal, there shall be no mercy for your kind.");
	end
end

function event_death_complete(e)
	e.self:Say(eq.ChooseRandom(
		"My comrades will avenge my death.",
		"Your name shall be added to the Guards of Faydark's most wanted list."
	));
end
