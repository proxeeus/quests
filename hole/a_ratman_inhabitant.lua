function event_combat(e)
	if e.joined then
		e.self:Emote("shouts in a shrill voice as it lunges to attack, 'Defeat the invaders!  They seek to invade our lair!'");
	end
end

function event_death_complete(e)
	e.self:Emote("let's out a loud squeak as it falls to the ground.");
end
