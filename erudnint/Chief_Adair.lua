function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail., citizen!! Have you business with me? If so, please speak quickly and be on your way.");
	end
end

function event_death(e)
	e.self:Say("Prepare to meet the vengeance of Erud!");
end

-- END of FILE Zone:erudnint  ID:24051 -- Chief_Adair