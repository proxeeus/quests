function event_death_complete(e)
		e.self:Emote("yips and falls to the ground. A tattered note appears to be tucked into his armor. ");
end

function event_combat(e)
	if(e.joined == true) then
		e.self:Emote("begins to howl and yip. 'Grrr.. Mad..ness!! Red, sweet red.");
	end
end