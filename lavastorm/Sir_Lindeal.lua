function event_combat(e)
	if(e.joined) then
		e.self:Say("In the name of the Rainkeeper, I strike at thee!!");
	end
end

function event_death_complete(e)
	local lines = {
		"Karana shall guide the Knights of Thunder to avenge the death of one of his flock.",
		"You will meet your own doom soon enough, my friend.. my influence with the Knights of Thunder is great, and they will not rest until I am avenged!",
	};
	e.self:Say(lines[math.random(#lines)]);
end