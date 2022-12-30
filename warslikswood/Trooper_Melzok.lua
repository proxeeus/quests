function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Back to Cabilis with you! You won't fare well in these parts. If you are just a broodling, stay close to the gate so we can protect you.");
	end
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Fear the blades of the Iksar!!");
	end
end

function event_slay(e)
	e.self:Say("Another victory for the Legion of Cabilis.");
end

function event_death_complete(e)
	e.self:Say("You have not won.  Consider yourself wanted by the Legion of Cabilis.");
end