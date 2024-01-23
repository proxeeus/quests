function event_death_complete(e)
	eq.spawn2(123247,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1); -- Garzicor's Wraith
end