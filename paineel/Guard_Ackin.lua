function event_say(e)
	local fac = e.other:GetFaction(e.self)
	if(e.message:findi("hail") and fac <= 4) then
		if(fac <= 4) then
			e.self:Say("Uggg. You needz [keyz]? Rrrrrrr.");
		end
	elseif(e.message:findi("keyz")) then
		if(fac <= 4) then
			e.self:Say("Uggggg. Take dis keyz.");
			e.other:SummonItem(6378);
		end
	end
end