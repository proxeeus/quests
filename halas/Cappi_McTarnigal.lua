function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail there, " .. e.other:GetName() .. "! If you are not a [member of the White Rose], then it be best that you stay on the lower level. This here floor is for honest ...ermm respectable rogues only.");
	elseif(e.message:findi("member of the white rose")) then
		e.self:Say("I hope that you are indeed respectable and loyal to Halas and the Rogues of the White Rose. To do otherwise would bring the wrath of the Six Hammers down on you. But enough with talk! Our caravan to the frigid north leaves in less than two days. and we are short on mammoth calf hides. Return four of them and you will be given items that show your loyalty to our Clan.");
		eq.signal(29070,1);
	elseif(e.message:findi("anything odd")) then
		e.self:Emote("'s voice turns into a hoarse whisper. ‘Well, funny you’re asking. A curious and rather distasteful chain of events has been plaguing me as of late. My scouts report that a Troll has been seen roaming the plains of Everfrost about a week ago, seeking a way to enter our city. That creature caused a great deal of disturbance in the country, blood has been shed - and nothing else since. At the same time, we’ve discovered four horribly [mutilated bodies] within Halas. This can’t be mere coincidence.'");
	elseif(e.message:findi("mutilation")) then
		e.self:Say("Well, it wasn’t a pretty sight. The bodies were fine - for the most part, except for their faces. The [brute] had completely desecrated those. There was not a single shred of skin left, only visible bone. We’ve managed to keep this affair under wraps while we investigate and said that the victims were out of town on an important errand, but I fear that more murders are about to happen, and panic will then surely strike the city.");
	elseif(e.message:findi("brute")) then
		e.self:Say("It seems clear to me that this Troll is responsible of the murders. I’ve had my finest trackers quietly roam the streets day in day out for the past week, but there was absolutely no sighting of that Troll. And this worries me doubly. What is a Troll doing so far up north, and why is that creature hell bent on murdering good, honest Halasians? I need somebody to [investigate].");
	elseif(e.message:findi("investigate")) then
		e.self:Say("Thank you " .. e.other:GetName() .. ". Our intelligence so far suggests that it’s pretty useless to look for an actual Troll. Beyond that, anything is possible. Talk to the people, like you normally would. Do not mention those murders. Should anybody behave suspiciously during your conversation, run to me and tell me that you do not trust them.");
	elseif(e.message:findi("not trust frenegan")) then
		e.self:Emote("'s eyes widen at the mention of Frenegan. 'WHAT ?! How could you have spoken to Frenegan? How would that be possible...since he was the first body to have been discovered ?! Is there some kind of foul magic at play ? No...it has to be something else, our shamans would have sensed any kind of necromancy being cast in the vicinity. Something [must be done].'");
	elseif(e.message:findi("done")) then
		e.self:Say("It pains me to say this, but you must slay Frenegan, whoever, or whatever it is now. Be careful though. People are not yet aware of the real Frenegan’s death, so what you’re about to do is technically a crime punishable by death. We cannot, and will not, help you in that matter. Should you find anything of importance on the corpse of...whatever this is, bring it right back to me.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 5243, item2 = 5243, item3 = 5243, item4 = 5243})) then	-- Mammoth Calf Hide X 4
		e.self:Say("You returned? We believed the gnoll pups got you. The caravan has already left, and these do me little good now. But, as I said before, one must remain respectable. Here is what I promised.");
		e.other:SummonItem(eq.ChooseRandom(5238,5239,5242,5236,5233,5231,5240,5241,5234,5232,5235,5237));
		e.other:Faction(275,10,0); 																		-- 275 : Faction Rogue's of the White Rose
		e.other:AddEXP(2500);
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 119473})) then
		e.self:Emote("frowns in disgust as you hand him the bloody mask. ‘Eeeew, this is gruesome. It is a mask fashioned with the flesh of our fallen comrades, conferring him the ability to disguise himself as a son of Halas. So this is how he tricked us in staying in our city unnoticed... Clever. Here, take it back, I have absolutely no use fo-- wait a minute ! Could you please hand it back to me for a moment ? Something’s not right here...");
		e.other:Faction(275,10,0); 																		-- 275 : Faction Rogue's of the White Rose
		e.other:AddEXP(250000);
		e.other:Ding();
		e.other:SummonItem(119472);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 119472})) then
		e.self:Say("Look at those markings...and the sewing ! This is pure Halasian craftsmanship ! One of our [own] has helped that dreadful monster commit his vile deeds!");
		e.other:SummonItem(119472);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
