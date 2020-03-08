function event_combat(e)

	local racesplural = require("races_plural");

	e.self:Say( eq.ChooseRandom( string.format("It's %s like you who have ruined your own lands. You'll not ruin mine!",racesplural.GetPlural(e.other:GetRace())), 
								 string.format("%s have no place in our realm!",racesplural.GetPlural(e.other:GetRace())),
								 string.format("%s like you are better left dead than alive!",racesplural.GetPlural(e.other:GetRace())),
								 string.format("Time to die %s.",racesplural.GetSingle(e.other:GetRace()))
								)
			   );

end

function event_spawn(e)
	local randomface = require("random_face");
	randomface.RandomFace(e.self, eq);
end


function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("seems to have lost all hope. He sadly looks to the ground. His shackles are different than the others you see in this cell. One is definitely steel and not of goblin design. The other is made of an unfamiliar metal.");
	elseif(e.message:findi("veltar")) then
		e.self:Emote("'s soiled face shines with a glint of hope. 'You know my name? Who has [sent] you to find me?'");
	elseif(e.message:findi("sent")) then
		e.self:Say("Then word has gotten to him!! If you be a monk of the third rung I will accept your aid. You must find the [coppernickel key]. It is required to release me from this goblin shackle. I have no reward to offer other than the shackle of steel. Give me both your shackles of the third rung along with the key and I shall reward you the first shackle of the fourth rung.");
	elseif(e.message:findi("coppernickel")) then
		e.self:Say("The key is split into three parts. Part one is the base and must be combined with the two remainder pieces. One piece is in here and the other was lost. I overheard the goblins chattering and recognized the goblin phrase, 'lair of flying mouths'!! As for the base, I do not know.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12839,item2 = 4195, item3=4194})) then -- Coppernickel Key, Bronze Shackles, Copper Shackles
		e.self:Say("I made a pact to reward the shackle of steel to one who could deliver the coppernickel key and the shackles of copper and bronze.");
		e.self:Say("I made a pact to reward the shackle of steel to one who could deliver the coppernickel key and the shackles of copper and bronze.");
		e.self:Emote("hands you a shackle and removes the coppernickel shackle so he may flee. He places your shackles on his wrists and darts into the darkness.");
		e.other:SummonItem(4196);
		e.other:Ding();
		e.other:AddEXP(10000);
		e.self:Depop(true);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end