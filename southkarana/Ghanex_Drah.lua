function event_combat(e)
	if(e.joined == true) then
		e.self:Say("And now, puny mortal, you shall feel the touch of the grave!");
	end
end

function event_slay(e)
	e.self:Say("Another corpse to add to our legions, how fortunate you are mortal!");
end

function event_death_complete(e)
	e.self:Say("Aroow! Though my body is destroyed my spirit will return, thus is the blessing of my immortality!");
end