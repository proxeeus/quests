function event_combat(e)
	if(e.joined) then
		e.self:Say("Time fer you to feel the cold steel of the Butcherblock Bandits!");
	end
end

function event_death_complete(e)
	e.self:Say("You shall soon feel the daggers of the Butcherblock Bandits upon your back!");
end

function event_slay(e)
	e.self:Say("How could you ever expect to defeat the swift blades of the Butcherblock Bandits?!");
end
