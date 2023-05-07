function event_slay(e)
	e.self:Say("Slightly crispy but still tasty, who shall be next?");
end

function event_combat(e)
	if(e.joined == true) then
	  e.self:Shout("How amusing. You foolish mortals actually think to challenge me? Very well, then, I shall enjoy searing the flesh from your bones!");
	end
  end
  
  