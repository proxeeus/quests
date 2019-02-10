function event_spawn(e)
	eq.set_timer("depop",300000);
	e.self:Say("Peace to you, my child.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, warrior of mind and body. To prove your worth to me, you must complete a test. Which test do you wish to take? I will permit you to take the test of tears, fists, or tranquility. Though I am also willing to make a trade if you are interested.");
	elseif(e.message:findi("tears")) then 		--monk test of tears
		e.self:Say("The test of tears involves knowing when to release, and when to provide a shoulder for another. Bring me a Spiroc Statuette, a Spiroc Talon, and a Silken Wrap. I will teach you the way.");
	elseif(e.message:findi("fists")) then 		--monk test of fists
		e.self:Say("A monk must know when to use his or her fists, and when to use ones mind. You must decide in this endevour, which you shall use. Return to me, once you have found them, a pair of Brass Knuckles, a White Spiroc Feather, an Emerald Amethyst, and a Nebulous Sapphire.");
	elseif(e.message:findi("tranquility")) then --monk test of tranquility
		e.self:Say("Ah, the test of tranquility. Only the tranquil monk can achieve enlightenment. Are you such an individual? Time shall tell. Retrieve these items for me. Bring an Aged Nectar, a Writ of Quellious, and a Glowing Diamond and we shall asses your ability.");
	elseif(e.message:findi("trade")) then 
		e.self:Say("I am searching for my weapon Wu's Tranquil Fist. It seems there has been a complaint made about their performance so I have taken some steps to improve them. If you bring what I've asked you will be rewarded.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20800, item2 = 20954, item3 = 20799})) then 					--monk test of tears using silken wrap, spiroc statuette, spiroc talon
		e.other:SummonItem(1283); 	--ton po's shoulder wraps
		e.other:AddEXP(100000);
		e.self:Say("You have moved closer to enlightenment.");
		e.other:Ding();
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20803, item2 = 20801, item3 = 20802, item4 = 20960})) then 	--monk test of fists using brass knuckles, ethereal amethyst, nebulous sapphire, white spiroc feather
		e.other:SummonItem(11690); 	--wu's tranquil fist
		e.other:AddEXP(100000);
		e.self:Say("You have moved closer to enlightenment.");
		e.other:Ding();
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20967, item2 = 20804, item3 = 20805, item4 = 20960})) then 	--monk test of tranquility using aged nectar, degree of quellious, tear of quellious
		e.other:SummonItem(11698); 	--golden sash of tranquility
		e.other:AddEXP(100000);
		e.self:Say("You have moved closer to enlightenment.");
		e.other:Ding();
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 11690})) then
		e.other:SummonItem(27715); 
		e.self:Say("Thank you for bringing me back the Wu's Tranquil Fist. Here's something much better.");
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
