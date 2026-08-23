-- npcid: 118090
-- Regular (non-quest) spawned version.

function event_signal(e)
	-- signal from Broodmother to walk out to front of fort to meet her.
	if(e.signal == 1) then
		eq.start(65);	-- Grid ported from P2002 on 23/08/2026
	-- signal from Broodmother to repop as quest version and run!
	elseif (e.signal == 2) then
		eq.depop_with_timer();
		eq.spawn2(118058,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());	-- spawn #Fergul_Frostsky
	end
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Die like the dog you are...");
	end
end


