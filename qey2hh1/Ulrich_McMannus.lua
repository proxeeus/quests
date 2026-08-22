function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the village of McMannus. We sell many goods. Feel free to look around - just keep your hands to yourself. Good day.");
	elseif(e.message:findi("searching for the fugitive")) then
		e.self:Say("Searching for someone, eh?  You will most likely never find them on the plains.  This is a vast area.  I could have Frostbite help you search.  He is quite good at [tracking prey].");
	elseif(e.message:findi("tracking prey")) then
		e.self:Say("Frostbite can track down anyone, be they man or beast.  All one needs to do is obtain a SWEATY piece of clothing recently worn by the one you seek.");
	end
end

function event_combat(e)
	if(e.joined == true) then
		e.self:Say("AARRGHHH!!!!!  Into the fray come the Wolves of the North.  Cut you down, I will!!");
	end
end

function event_death_complete(e)
	e.self:Say("You fool!!  My brothers and sisters of the Wolves of the North shall hunt you down!  You.. are.. through..");
end

-- END of FILE Zone:qey2hh1  ID:5187 -- Ulrich_McMannus