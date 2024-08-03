-- Edit on April 19, 2007 by Kilelen
-- Edit by spre
-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings! I am the operator of this scrapyard. If you have any scrap metal, I would be glad to purchase it from you in loads of four. The Gemchoppers no longer allow me to accept blackbox fragments and micro servos.");
	elseif(e.message:findi("princess joleena")) then
		e.self:Say("No!! You cannot have my magic Fairie Wing!! I need it. I read somewhere within the great library that the magic wing from a fairie princess will restore my full head of hair. Look at me!! I am bald!! I have no [friends] at all.");
	elseif(e.message:findi("friend")) then
		e.self:Say("Oh. You are just saying that so you can get my fairie wing. I will make you a deal. I cannot rely on this wing forever. I will trade it with you if you could get me a case of hair tonic. If you are a true friend you [will fetch the hair tonic] for me.");
	elseif(e.message:findi("hair tonic")) then
		e.self:Say("Great!! Here you go, my friend. Take this crate and within you shall fill each slot with hair tonic. When all are combined within the crate, return it to me for your wing. I am not sure what the tonic was or where I got it. There is some writing on the crate, but I could not identify it.");
		e.other:SummonItem(17979);
		e.other:Ding();
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13198, item2 = 13198, item3 = 13198, item4 = 13198})) then -- Turn in 4 scrap metal
		e.self:Say("For your efforts I shall reward you"); -- Not official dialog, Dont actually know what he says.
		e.other:SummonItem(eq.ChooseRandom(5013,5013,5013,5014,5014,5014,5015,5015,5015,5016,5016,5016,5019,5019,5019,5020,5020,5020,12340,12340,17033)); -- Various rusty weapons, Orb o flight and a contraption given when completed. All randomly.
		e.other:Faction(255,3,0);
		e.other:Faction(333,3,0);
		e.other:Faction(288,3,0);
		e.other:Faction(238,-3,0);
		e.other:Faction(1604,-3,0);
		e.other:AddEXP(1000); -- Amount of Experience guessed, No actual Experience Info.
		e.other:GiveCash(4,5,1,1); -- Amount of coin recieved is guessed, No actual coin Info.
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 9426, item2 = 28618, item3 = 29906, item4 = 28165})) then -- Bundle of Super Conductive Wires, Gold Tipped Boar Horn, Shard of Pure Energy, Silicorrosive Grease
		e.self:Say("I've been waiting for those.  Thank you, please take this!"); -- Text made up, I have no reference.
		e.other:SummonItem(15980); -- Note for Fimli
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12336})) then
		e.self:Say("Huzzah!! You are my friend. Now you can take my old toupee and get it repaired. Just go to Freeport and ask Ping to [repair the toupee]. Hey!! You know what? He is the guy who sells the hair tonic!! I remember now. Well,.. Get my toupee repaired and I will give you the fairie wing.");
		e.other:SummonItem(12337);
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12254})) then
		e.self:Say("Double Huzzah!! You are a good friend " .. e.other:GetName() .. ". Now mayhaps I shall find myself a wife. Here pal, the fairy wing. I hope it can give you a great head of hair. You need it.");
		e.other:SummonItem(12339);
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13216, item2 = 13217})) then
		e.self:Say("I hear there is one more on the loose. Find him and then I shall pay you.");
		e.self:Say("Good. The citizens of Ak'Anon are safe from those little critters. They may have injured someone; that is why they were deactivated. Here is something I found in the scrapyard. I hope you can find a purpose for it."); 
		e.other:SummonItem(eq.ChooseRandom(17981, 17981, 6027));
		e.other:Faction(255,3,0);
		e.other:Faction(333,3,0);
		e.other:Faction(288,3,0);
		e.other:Faction(238,-3,0);
		e.other:Faction(1604,-3,0);
		e.other:Ding();
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)
    if(e.joined == true) then
      e.self:Say("Guards! Guards! Help me!");
    end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end
  
