function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("ignores you.");
	elseif(e.message:findi("challenge eejag")) then
		eq.spawn2(27034,0,0,324,1007,-35,0);
		eq.depop_with_timer();
	end
end
