function event_combat(e)
	if(e.joined) then
		e.self:Say("The fall of the Coldain and the dragons will some day come.  We giants will stride this land as the chosen of Rallos Zek once more.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to Iceshard Manor, home of the Iceshard brothers, Klaggen and Vorken.");
	end
end