function event_combat(e)
	if(e.joined) then
		e.self:Emote("growls fiercely, saliva foaming around its ferocious, jagged maw, 'This is our home now!  Begone, or the legions of TomEar shall slay you all'");
	end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end

function event_slay(e)
	e.self:Say("Bbbaarrrrkkk!!!  Another intruder has fallen at the hands of the TomEar.  Who is next to fall?  HHhhooooowwwLLLL!!!");
end