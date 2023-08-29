function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("What brings you to the hall of the frost giants, little one? Have you come to [serve] our lord and master? Or are you simply a scout for a raiding party? I warn you, do not make war on my kin. I will twist the [elements] to my will and destroy you if that is your intent.");
	elseif (e.message:findi("serve")) then	
		e.self:Say("You could best serve the masters by serving me. The more time I have to tend to my research the better. I have several [minor tasks] which you could easily handle...");
	elseif (e.message:findi("minor task")) then	
		e.self:Say("In the wreched jungle to the west there lives a race of faries protected by Tunare and her other minions. These abominations are called the Sifaye. I belive that the strength of the Wakening lands is linked not only to Tunare herself, but her connection with these foul beasts. Bring me the wings of one of their so called knights and the heads of three commoners and I will reward you for such busy work.");
	elseif(e.message:findi("elements")) then
		e.self:Say("The elements of  nature, of course!  Over the years, I have learned that I can bend the powers of nature and the spirits of those long passed to my will and achieve many things.");
	end
end

function event_trade(e)

	local item_lib = require('items');

	if(item_lib.check_turn_in(e.trade, {item1 = 25112,item2 = 25113,item3 = 25113,item4 = 25113})) then
		e.self:Say("Congratulations, slayer of tiny beasts. Take this living tattoo for your troubles.  If you wish to continue to serve me, find a way to capture more noble sifaye... alive.");
		-- verified live faction
		e.other:Faction(448, 10); --kromzek
		e.other:Faction(419, 10); --kromrif
		e.other:Faction(429, 10); -- KT
		e.other:Faction(436, -30); --CoV
		e.other:QuestReward(e.self,0,0,0,0,25056,5000); -- Silver Dragon Tattoo
	end

	item_lib.return_items(e.self, e.other, e.trade);		

end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Your bones will be crushed by the Kromrif of Kael Drakkel!");
	end
end