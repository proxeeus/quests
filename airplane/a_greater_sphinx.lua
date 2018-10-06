function event_cast_begin(e)
	if(e.spell:ID() == 982) then
		e.self:Shout(e.self:GetTarget():GetName() .. "!");
	end
end
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
