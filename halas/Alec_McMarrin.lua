function event_combat(e)
	if(e.joined) then
		e.self:Say(string.format("Time to die %s.", e.other:GetName()));
	end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. " .. e.other:GetName() .. "! I patrol Halas to insure the safety of the travelers and the resident clans. Just ask if you need help in finding your destination.");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
