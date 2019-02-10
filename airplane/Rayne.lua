function event_spawn(e)
	eq.set_timer("depop",300000);
	e.self:Say("Rayne has come.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, " .. e.other:GetName() .. ". I am apprentice Rayne. Do you wish to test your abilities? Or perhaps you would like to find out what I have to trade?");
	elseif(e.message:findi("test")) then
		e.self:Say("Great, let us waste no more time! Do you wish to begin your test of Deception, Stealth, or Cunning?");
	elseif(e.message:findi("deception")) then 	--rogue test of deception
		e.self:Say("Deception it is. Proceed upward through the sky and return to me the honeyed nectar, a bixie stinger, a lightning rod, and a bloodsky sapphire for the test of deception and earn Ebonsting, caller of lightning.");
	elseif(e.message:findi("stealth")) then 	--rogue test of stealth
		e.self:Say("Stealth is a must. Travel among the residents of the sky and bring to me a Pegasus Statuette, a Prismatic Sphere, and a Fine Wool Cloak. In return, The Scintillating Bracer of Protection shall be yours.");
	elseif(e.message:findi("cunning")) then 	--rogue test of cunning
		e.self:Say("Cunning, the true source of all rogue power. Plan and succeed above us and return to me a bronze disc, a jester's mask, and some red face paint to compelte the test of cunning. The transparent mask shall be yours if you do so.");
	elseif(e.message:findi("trade")) then
		e.self:Say("Bartering is another important skill. Sometimes finding something that most consider junk can be useful to another for a whole different reason. Find me a Transparent Mask, Bracer of Protection or Ebonsting and I will search out a much better upgrade for you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20963, item2 = 20994, item3 = 20995, item4 = 20996})) then  	--rogue test of deception using honeyed nectar, bixie stinger, lightning rod, bloodsky sapphire
		e.other:SummonItem(11677); 	--ebonsting
		e.other:AddEXP(100000);
		e.self:Say("Very good. Here's your reward.");
		e.other:Ding();
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20949, item2 = 20990, item3 = 20991, item4 = 20996})) then 	--rogue test of stealth using pegasus statuette, prismatic sphere, fine wool cloak
		e.other:SummonItem(2701); 	--scintillating bracer of protection
		e.other:AddEXP(100000);
		e.self:Say("Very good. Here's your reward.");
		e.other:Ding();
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20935, item2 = 20987, item3 = 20986, item4 = 20996})) then 	--rogue test of cunning using bronze disc, jester's mask, red face paint
		e.other:SummonItem(2702); 	--transparent mask
		e.other:AddEXP(100000);
		e.self:Say("Very good. Here's your reward.");
		e.other:Ding();
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 11677})) then
		e.other:SummonItem(27704); 
		e.self:Say("Thank you for bringing me back Ebonsting. Here's something much better.");
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 2702})) then
		e.other:SummonItem(27702); 
		e.self:Say("Thank you for bringing me back the Transparent Mask. Here's something much better.");
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
