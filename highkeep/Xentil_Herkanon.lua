function event_spawn(e)
	eq.set_timer("depop", 1800000);
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_death_complete(e)
	eq.signal(6187,0);
	eq.signal(6188,0);
	eq.stop_timer("depop");
	e.self::Say("Big mistake, my friend!! The Circle of Unseen Hands shall surely find and cut you down for the death of the nephew of Renux Herkanor. My bodyguards will be waiting for you!!");
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.signal(6187,0);
		eq.signal(6188,0);		
		eq.depop();
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I do not desire any company other than my bodyguards. Be off!!");
	end
end

function event_combat(e)
	e.self::Say("You have made a big mistake choosing to battle a high member of the Circle of Unseen Hands. Now you shall pay!!");
end