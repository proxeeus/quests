-- Converted to .lua by Speedz

function event_waypoint_arrive(e)
	if(e.wp == 30) then
		e.self:Say("Click.. Dust. Dust. Dust.");
	elseif(e.wp == 42) then
		e.self:Say("Click.. Dust. Dust. Dust.");
		e.self:SetRunning(true);
	end
end

function event_spawn(e)
	eq.set_timer("pick_up", 2000);
end

function event_timer(e)
	if ( e.timer == "pick_up" ) then		
		while ( e.self:CheckGround() ) do
			e.self:Emote("clicks as a plate slides to the side revealing a hose that extends and sucks up an item from the ground.");
		end
	end	
end