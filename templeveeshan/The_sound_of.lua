-- The_sound_of NPCID: 124130
function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	e.self:Emote("a thousand wings fills the halls.");
	eq.depop_with_timer();
end