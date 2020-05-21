function event_say(e)
	if(e.message:findi("berradin")) then
		e.self:Say("'What's with the interrogation outlander? Do you expect me to know every Coldain in Thurgadin? I'm afraid I can't help you there.");
	end
end

function event_spawn(e)
	e.self:Say("'Hiya Peff... err... uhh... outlander? I have heard tales of your deeds, please tell me you've come to rescue me from these heathens. The Dain would certainly reward you for such a noble act.");
end

function event_combat(e)
	if(e.joined) then
		-- Start Plate Cycle
		eq.spawn2(113443, 0, 0, 1159, -819, -126, 128);	-- 	Grondon_Zekkin
		eq.spawn2(113548, 0, 0, 1159, -859, -126, 128);	--	Kromzog_Zekkin
		e.self:Depop();
		e.self:Emote("calls for help and scurries off.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade,{item1 = 18172})) then	-- Letter to Doldigun
		e.self:Say("I was just following orders! I swear it! Here, this is proof! Take it and be gone. If you continue harassing me I'll call for help and you'll never make it out of here alive.");
		e.other:SummonItem(1464); -- Song: Hymn of Restoration
		e.other:AddEXP(500);
		e.other:Ding();
	end
end