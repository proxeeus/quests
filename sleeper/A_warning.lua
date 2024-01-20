function event_enter(e)
	e.self:Emote("fills your mind `HEED THESE WORDS!  This prison was made to hold the most dangerous being ever to walk the face of Norrath.  The combined might of all Wurmkind was required to subdue The Sleeper, and only eternal vigilance will keep him imprisoned.  If you are not here on behest of the Council, you will be destroyed unless you depart now.  YOU HAVE BEEN WARNED!`");
	eq.depop_with_timer();
end

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end