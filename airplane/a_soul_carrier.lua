function event_death_complete(e)
	-- send a signal to the Key_Master
	eq.signal(71056,2,200000);
	-- on death of soul carrier two a essence carrier spawn
	eq.spawn2(71070,0,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
	eq.spawn2(71070,0,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
	
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(71107) == false) then
		eq.spawn2(71107,0,0,572,1467,-790,128); 							--used Magelo to get the closest loc as possible.
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------