function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Lots to do! Many books to place and scrolls to file! Feel free to browse but, please, don't make a mess!");
	end
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("I will make sure I remove every last bit of your remains from the floor of this library!");
	end
end