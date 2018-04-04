function event_death(e)
	e.self:Say("My comrades will avenge my death.");
end

function event_say(e)
  if(e.message:findi("hail")) then
    e.self:Say(string.Format(
      "Hail, %s. I am Deputy Budo Bullnose, the squad leader of the Great Wall Patrol. Be very careful in the lands beyond the wall. They are filled with dangerous beasts, as well as [Clan Runnyeye]."
      ,e.other:GetName()));
  elseif(e.message:findi("clan runnyeye")) then
    e.self:Say("Beyond this wall lies Runnyeye, the lair of the goblins of Clan Runnyeye. They have been a nuisance to Rivervale for quite some time. If you wish to join the fight, go to Rivervale and ask Sheriff Roglio about Clan Runnyeye.");
  elseif(e.message:findi("reporting for duty")) then
    e.self:Say(string.Format(
    "Stand tall then, Deputy $name. Your orders are to keep the creatures from venturing into the community of Rivervale and to kill many goblins. Check the goblin bodies, if you should find unbroken warrior beads on them, take them to Sheriff Roglio Bruth and should you be lucky enough to find a bizarre grappling device, you are to take it to Marshal Ghobber Truppack immediately! One more thing - should you defeat any orcs in battle, bring me their leather belts and I shall reward you for the great victory. May the power of Underfoot be with you!"
    ,e.other:GetName()));
  end
end

function event_trade(e)
	local item_lib = require("items");
	local random_copper = math.random(10);
	local random_silver = math.random(10);
	local random_gold = math.random(10);
	local random_planinum = math.random(10);

	if(item_lib.check_turn_in(e.trade, {item1 = 18911})) then
		e.self:Say(string.Format(
      "Grand work. Deputy $name! You will become a full-fledged deputy in no time. You should check in with Marshal Ghobber from time to time to see if you have earned your squad ring. Just go up to him and ask. 'Am I one with the Wall?' He will know. but you must first show your bravery in many battles against the goblins."
      ,e.other:GetName()));
		e.other:Ding();
		e.other:Faction(133,10,0);
		e.other:Faction(208,10,0);
		e.other:Faction(316,10,0);
		e.other:Faction(88,-30,0);
		e.other:Faction(218,10,0);
		e.other:AddEXP(200);
    e.other:GiveCash(random_copper,random_silver,random_gold,random_planinum);
  end
end
