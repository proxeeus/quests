-- As_you_pass NPCID: 124148
function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	e.self:Emote("the archway a faint glow surrounds your body.");
	eq.depop_with_timer();
end