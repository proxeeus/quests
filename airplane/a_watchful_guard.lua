function event_combat(e)
	if(e.joined) then
		e.self:Say("Oh! You're in big trouble now! We don't like intruders trying to kill us! Time for you to die, "..e.other:GetName().."!");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------