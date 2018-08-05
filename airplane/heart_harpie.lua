function event_combat(e)
	if(e.joined) then
		e.self:Say("How dare you, "..e.other:GetName().."! You attack us after we allow you to enter our domain in peace? Time for you to die, "..e.other:GetName().."!")
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------