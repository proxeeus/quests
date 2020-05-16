function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(30164) == true) then	-- only trigger if Ring 9 is in the inventory ?
		eq.signal(118061, 1);
	end
end