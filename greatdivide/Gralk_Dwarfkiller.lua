-- npcid: 118091
-- Regular (non-quest) spawned version.

function event_combat(e)
	if(e.joined) then
		e.self:Say("Die like the dog you are...");
	end
end

function event_signal(e)
	-- signal from Broodmother
	if(e.signal == 1) then
		eq.depop_with_timer();
		eq.spawn2(118086,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());	-- spawn #Gralk_Dwarfkiller
	end
end
