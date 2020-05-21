function event_death_complete(e)
	e.self:Shout("Doldigun, you have caused us too much trouble. You are no longer welcome here! Show yourself!");
	eq.spawn2(113508, 0,0,1126.4,-840.6,-118.3,125.2);	-- Doldigun, loot version 
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Your bones will be crushed by the Kromrif of Kael Drakkel!");
	end
end

function event_spawn(e)
	e.self:MoveTo(1179, -840, -126, 128, true);
end