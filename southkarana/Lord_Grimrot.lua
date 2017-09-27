function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to my field of decay. Won't you be so kind as to attack me? I have need of more bodies to join my diseased legion. Try it, maybe you shall win and gain my trusty [Pestilence].");
	elseif(e.message:findi("pestilence")) then
		e.self:Say("My beloved scythe. Upon my death, my soul shall live withn her.  Such is the pact.");
	end
	elseif(e.message:findi("arlena")) then
		e.self:Say("My beloved Arlena is my most perfect creation. A bit of flesh here, a bit of bone there and I created her. She left my arms while I was away. Find her and stop her. Return her bones to me so that I may restore her. She has no doubt returned to where I first met.. most.. of her, [Mistmoore Castle]!!");
	end
	elseif(e.message:findi("mistmoore castle")) then
		e.self:Say("It stands on the continent of Faydwer. That is all you need to know.");
	end
end

function event_combat(e)
	if(e.joined == true) then
		e.self:Say("Death awaits you, my foolhardy friend.");
	end
end

function event_death_complete(e)
	e.self:Say("You have won this round, but my soul shall find its way back to the Bloodsabers.");
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 12137}))
		e.self:Say("The head for my commander. Let us see. I have a body ready for it. There. Hahahaha!! As for your fine work, take this. Also, I believe you can help me find my beloved [Arlena].");
		e.other:Ding();
		e.other:AddEXP(75000);
		e.other:Faction(21,15,0);
		e.other:Faction(135,-10,0);
		e.other:Faction(235,-10,0);
		e.other:Faction(257,-10,0);
		e.other:Faction(53,10,0);
		e.other:GiveCash(0,12,1,5);
	end
end

-- END of FILE Zone:southkarana  ID:3312 -- Lord_Grimrot 

