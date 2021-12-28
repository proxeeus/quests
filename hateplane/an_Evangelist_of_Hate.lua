function event_combat(e)
	if(e.joined == true) then
		e.self:Say("None shall defile the realm of our master!");
	end
end

function event_slay(e)
	e.self:Say("Embrace our lord before your soul departs, and perhaps he shall grant you the boon of eternal life in his service!");
end

function event_death_complete(e)
	e.self:Say("Innoruuk, I have failed you!");
end

function event_spawn(e)
	eq.set_timer("praise", 300000);	-- 5 minutes
end

-- The famous, annoying signal that will launch a zone-wide spam of "All praise Innoruuk, our lord and creator!".
function event_timer(e)

	if(e.timer == "praise") then
		eq.stop_timer(e.timer);
		
		e.self:Shout("ALL PRAISE INNORUUK, OUR LORD AND CREATOR!");
		e.self:Say("Join us, my hateful brethren!");
		
		-- signal mobs
		eq.signal(76020, 10);
		eq.signal(76021, 10);
		eq.signal(76022, 10);
		eq.signal(76023, 10);
		eq.signal(76024, 10);
		eq.signal(76071, 10);
		eq.signal(76072, 10);
		eq.signal(76073, 10);
		eq.signal(76074, 10);
		eq.signal(76075, 10);
		-- 
		
		eq.set_timer("praise", 300000);	-- test timer 1
	end
end