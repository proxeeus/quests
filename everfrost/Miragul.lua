function event_combat(e)
	if(e.joined) then
		e.self:Say("Foolish mortal, you dare attack me?! Die!!");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Leave me be, worm! I have important matters to attend to!");
	end
end