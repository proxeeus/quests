function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("How are you, bub?  Enjoy the drinks, but watch your gold. There are rogues everywhere.");
	end
end

