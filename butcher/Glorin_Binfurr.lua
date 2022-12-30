function event_combat(e)
	if(e.joined) then
		e.self:Say("For the glory of Kaladim, have at thee!!");
	end
end

function event_death_complete(e)
	e.self:Say("My brothers of the Stormguard shall avenge me!!  Your days are numbered!");
end

function event_slay(e)
	e.self:Say("For the glory of Kaladim!! You are no more.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Pleasure to meet you.  Keep your eye out for the ship.  You don't want to miss it.");
	elseif(e.message:findi("fishing spot")) then
		e.self:Say("Mudtoes!! I have heard tales of that foul clan of ogres. A few of the passengers aboard the ships have claimed to have seen one of them, off and on, amongst pirates in the Ocean of Tears!!");
	end
end
