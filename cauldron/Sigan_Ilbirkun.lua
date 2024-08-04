function event_say(e)
	fac = e.other:GetFaction(e.self);
	if(fac < 7) then
		if(e.message:findi("hail")) then
			e.self:Say("Hail!! You are welcome to rest here.");
			eq.signal(70007,5); -- Ghilanbiddle Nylwadil
		elseif(e.message:findi("escort")) then
			e.self:Say("Yes. Follow me closely!!");
			eq.move_to(-141.75, 1201.45, 141.42, 0);
		end
	else
		e.self:Say("Your shifty eyes tell me that you are no ally of the Stormguard.");
	end
end

function event_combat(e)
    if(e.joined == true) then
      e.self:Say("It's bashing time!!");
    end
end

function event_death_complete(e)
    e.self:Say("My brothers of the Stormguard shall avenge me!!  Your days are numbered!");
end