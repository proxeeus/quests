function event_spawn(e)
	e.self:SetRunning(true);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("No time to talk!! I must be on my way. I am in a race with the paladins from the Temple of Life.");
	end
end

function event_combat(e)
	if(e.joined == true) then
		e.self:Say("In the name of the Rainkeeper, I strike at thee!!");
	end
end

function event_death_complete(e)
	e.self:Say("You will meet your own doom soon enough, my friend.. my influence with the Knights of Thunder is great, and they will not rest until I am avenged!");
end
