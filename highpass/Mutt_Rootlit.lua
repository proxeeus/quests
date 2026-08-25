function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. stranger. I would talk to thee. but [Barn] has instructed me not to converse with strangers.");
	elseif(e.message:findi("Barn")) then
		e.self:Say("Barn is my hero. He saved me from a life on the evil streets in Freeport.");
	end
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Militia!! Someone call the militia!");
	end
end

function event_death_complete(e)
	e.self:Say("You have no idea what a big mistake you made. Either my fellow rogues shall find you or the Freeport Mi..  Unnnghh.");
end
