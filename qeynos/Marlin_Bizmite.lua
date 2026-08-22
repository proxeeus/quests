function event_say(e)

	if(e.message:findi("hail")) then
		e.self:Say("Greetings, fellow fisherman. You must be a fisherman. You have the stench of one. If you are not, might I suggest this new pastime I have heard of? A bath!!");
	elseif(e.message:findi("prexus")) then
		e.self:Say("Oh no!! Not another Prexus freak!! Listen up aqua man, if you think a man named Marlin has any chance of giving up fishing, you have got another think coming. Go night diving in the north pond, you might find some bait for your Prexus blessing.");
	end

end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Guards!  Guards!  Help me!!");
	end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end
