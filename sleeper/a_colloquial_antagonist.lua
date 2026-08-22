function event_combat(e)
	if(e.joined) then
		e.self:Say("Your presence here is sacrilege!  You will feel the power that dragon kin wields!");
	end
end

function event_death_complete(e)
	e.self:Say("What is this atrocity?  Ancients forgive me, for I have failed in your presence.");
end
