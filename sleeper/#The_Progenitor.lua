function event_combat(e)
	if(e.joined) then
		e.self:Shout("One must attend to a distraction.");
	end
end

function event_death_complete(e)
	e.self:Shout("Beware creations of this one!  Powerful beings threaten to rouse The Sleeper!  This one has ceased to function.")
end

function event_slay(e)
	e.self:Say("One has dealt with an irritant.");
end