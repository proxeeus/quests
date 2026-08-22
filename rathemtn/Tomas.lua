function event_combat(e)
	if(e.joined) then
		e.self:Say("In the name of the Rainkeeper, I strike at thee!!");
	end
end

function event_slay(e)
	e.self:Say("Yet another foe of the Knights of Thunder has been sent to the grave.");
end

function event_death_complete(e)
	e.self:Say("You will meet your own doom soon enough, my friend.. my influence with the Knights of Thunder is great, and they will not rest until I am avenged!");
end