-- 10th Ring War
-- Great Divide
-- 118177 Zrelik the Scout
--
-- When Event Starts:
-- - Zone Depops
-- - Extra Dwarf Defenders spawn to guard TODO: make these dwarves 
--   Player controalable.
-- - 13 waves of mobs will spawn in succession; each wave will have 
--   a wave master (Captain, General, Warlord) when the wave master 
--   dies; it will start a timer (5min) before the next wave spawns
-- - 14th wave is just Narandi.
-- - There are three locations in which the giants will spawn and
--   start pathing twards Thurgadin.
--
-- Fail Conditions:
-- - Any Giant reaches the final waypoint of their pathing (which is 
--   near Thurgadin).
-- - Seneschal Aldikar dies
--

-- Notes:
-- Spawn Condition 1 is all the regular mobs: Great Divide in a regular state.
-- Spawn Condition 2 is the initial spawn state of the quest NPCs, Kromrif spearmen guarding the various passes, Coldain named, and coldain troops. 
-- Great Divide will be depoped of all regular NPCs save those mentioned
-- Spawn Condition 3 onwards are the waves.
-- Spawn Condition 22 is a set of Kromrif lined-up near Thurgadin in case of Giant victory.

local current_wave_number;

-- Coordinates used by Zrelik's command system
local current_x_position;
local current_y_position;
local current_z_position;

-- Determines if we're in the pre-war state, aka not fully started yet, but the Coldain council "cutscene" is still playing.
local pre_event = true;

-- Those two bools will be used during the pre-event to determine the actions to do with Badain once he reaches both his
-- destinations :
-- Moving to the coldain council will set badain_pre_event_wp_1 to true.
-- Being ordered by Aldikar to retreat to Thurgadin will set badain_pre_event_wp_2 to true.
-- During Waypoint_Arrive:
-- If badain_pre_event_wp_1 == true, it means he reached the council and will need to do the Salute emote.
-- if badain_pre_event_wp_2 == true, Badain will depop.
local badain_pre_event_wp_1 = false;
local badain_pre_event_wp_2 = false;

-- This variable controls the time between waves; currently 5min.
--local wave_cooldown_time = 5 * 60 * 1000;
-- Debug / testing : 5 secs.
local wave_cooldown_time = 5000;

-- The final time it'll take to reset Great Divide to it's basic state. 20 secs for debugging purposes
local stop_event_time	 = 20000;


-- Fail_Event is triggered when 
-- Aldikar dies
-- and/or
-- any Kromrif reaches its last checkpoint.
function Fail_Event()

	-- Signal warlost to despawn thurgadina and spawn Coldain corpses
	eq.signal(118213, 1);
	-- Depop the Dwarf Generals if they are still alive.
	eq.depop_all(118171);	-- Churn_the_Axeman
	eq.depop_all(118172);	-- Kargin_the_Archer
	eq.depop_all(118173);	-- Corbin_Blackwell
	eq.depop_all(118174);	-- Dobbin_Crossaxe
	eq.depop_all(118175);	-- Garadain_Glacierbane
	eq.depop_all(118166);	-- Aldikar
	
	eq.zone_emote(13, "The forces defending the Grand Citadel of Thurgadin have failed, the Kromrif have overrun the first and oldest race.  The age of the dwarf has come to an end...");
	eq.spawn_condition("greatdivide", 0, 1, 0);
	eq.spawn_condition("greatdivide", 0, 2, 0);
	eq.spawn_condition("greatdivide", 0, 3, 0);
	eq.spawn_condition("greatdivide", 0, 4, 0);
	eq.spawn_condition("greatdivide", 0, 5, 0);
	eq.spawn_condition("greatdivide", 0, 6, 0);
	eq.spawn_condition("greatdivide", 0, 7, 0);
	eq.spawn_condition("greatdivide", 0, 8, 0);
	eq.spawn_condition("greatdivide", 0, 9, 0);
	eq.spawn_condition("greatdivide", 0, 10, 0);
	eq.spawn_condition("greatdivide", 0, 11, 0);
	eq.spawn_condition("greatdivide", 0, 12, 0);
	eq.spawn_condition("greatdivide", 0, 13, 0);
	eq.spawn_condition("greatdivide", 0, 14, 0);
	eq.spawn_condition("greatdivide", 0, 15, 0);
	eq.spawn_condition("greatdivide", 0, 16, 0);
	eq.spawn_condition("greatdivide", 0, 17, 0);
	eq.spawn_condition("greatdivide", 0, 18, 0);
	eq.spawn_condition("greatdivide", 0, 19, 0);
	eq.spawn_condition("greatdivide", 0, 20, 0);
	eq.spawn_condition("greatdivide", 0, 21, 0);
	eq.spawn_condition("greatdivide", 0, 22, 1);	-- Kromrifs at Thurgadin Entrance
end

-- Stop_Event is the "technical" function  formally stopping the event (different from a Loss)
-- It's the final routine to be called when the entire event is over, regardless of player outcome.
function Stop_Event()
	-- Condition 1 is the general mobs in the zone
	eq.spawn_condition("greatdivide", 0, 1, 1);
	eq.spawn_condition("greatdivide", 0, 2, 0);
	eq.spawn_condition("greatdivide", 0, 3, 0);
	eq.spawn_condition("greatdivide", 0, 4, 0);
	eq.spawn_condition("greatdivide", 0, 5, 0);
	eq.spawn_condition("greatdivide", 0, 6, 0);
	eq.spawn_condition("greatdivide", 0, 7, 0);
	eq.spawn_condition("greatdivide", 0, 8, 0);
	eq.spawn_condition("greatdivide", 0, 9, 0);
	eq.spawn_condition("greatdivide", 0, 10, 0);
	eq.spawn_condition("greatdivide", 0, 11, 0);
	eq.spawn_condition("greatdivide", 0, 12, 0);
	eq.spawn_condition("greatdivide", 0, 13, 0);
	eq.spawn_condition("greatdivide", 0, 14, 0);
	eq.spawn_condition("greatdivide", 0, 15, 0);
	eq.spawn_condition("greatdivide", 0, 16, 0);
	eq.spawn_condition("greatdivide", 0, 17, 0);
	eq.spawn_condition("greatdivide", 0, 18, 0);
	eq.spawn_condition("greatdivide", 0, 19, 0);
	eq.spawn_condition("greatdivide", 0, 20, 0);
	eq.spawn_condition("greatdivide", 0, 21, 0);
	
	eq.spawn_condition("greatdivide", 0, 22, 0);
	
	pre_event = true;
	badain_pre_event_wp_1 = false;
	badain_pre_event_wp_2 = false;
	
	current_spawn_condition = 3;
	eq.depop_all(118177);	-- Zrelik
end

function Win_Event()
	-- Depop the Dwarf Generals if they are still alive and repops them near Thurgadin's entrance for the extra
	-- quest rewards
	eq.depop_all(118171);	-- Churn_the_Axeman
	eq.depop_all(118172);	-- Kargin_the_Archer
	eq.depop_all(118173);	-- Corbin_Blackwell
	eq.depop_all(118174);	-- Dobbin_Crossaxe
	eq.depop_all(118175);	-- Garadain_Glacierbane
	
	eq.spawn2(118171, 0, 0, -44, -792, 51, 230);	-- Churn_the_Axeman
	eq.spawn2(118172, 0, 0, -37, -788, 51, 230);	-- Kargin_the_Archer
	eq.spawn2(118173, 0, 0, -27, -788, 51, 230);	-- Corbin_Blackwell
	eq.spawn2(118174, 0, 0, -17, -788, 51, 230);	-- Dobbin_Crossaxe
	eq.spawn2(118175, 0, 0, -7,  -788, 51, 230);	-- Garadain_Glacierbane
end

function Master_Spawn(e)
  -- The first spawn condition to work with is 3; so 
  -- if we reset the event; we need to reset this to 3
  current_spawn_condition = 3;

  -- Reset all the spawn conditions to a clean state.
  Stop_Event();

end

function Start_Event()
	eq.spawn_condition("greatdivide", 0, 1, 0);
	eq.spawn_condition("greatdivide", 0, 2, 1);

	pre_event = false;
	if(current_spawn_condition == nil) then
		current_spawn_condition = 3;
	end

	-- Signal the ringtemmaster to spawn the first wave...
	eq.signal(118170, 1);

	-- Spawn the Dwarf Generals with spawn commands 
	-- so they aren't depopped when Narandi is killed
	-- and the zone is reset to normal mode.
	eq.spawn2(118171, 0, 0, 1545, -1070, 320, 368);	-- Churn_the_Axeman
	eq.spawn2(118172, 0, 0, 855, -1093, 32, 375);	-- Kargin_the_Archer
	eq.spawn2(118173, 0, 0, 100, -2880, -150, 509);	-- Corbin_Blackwell
	eq.spawn2(118174, 0, 0, 0, -1090, 20, 252);		-- Dobbin_Crossaxe
	eq.spawn2(118175, 0, 0, -1835,  -570, 69, 147);	-- Garadain_Glacierbane
	eq.spawn2(118166, 0, 0, -111,  0, 98, 253);		-- Aldikar
end

function Zrelik_Say(e)
	current_x_position = e.self:GetX();
	current_y_position = e.self:GetY();
	current_z_position = e.self:GetZ();
	
	if (e.other:Admin() >= 80 and e.other:GetGM()) then
		if (e.message:findi('end')) then
		  Stop_Event();

		  eq.depop_all(118171);	-- Churn_the_Axeman
		  eq.depop_all(118172);	-- Kargin_the_Archer
		  eq.depop_all(118173);	-- Corbin_Blackwell
		  eq.depop_all(118174);	-- Dobbin_Crossaxe
		  eq.depop_all(118175);	-- Garadain_Glacierbane

		elseif (e.message:findi('start')) then
			pre_event = false
			e.self:SetRunning(true);
			e.self:SetFollowID(e.other:GetID());
			Start_Event();

		end
	end
	if(e.message:findi("for the dain, attack!") and pre_event == false) then
		e.self:Shout("All able Coldain, come to me at once!");
		eq.signal(118171, 10);
		eq.signal(118172, 10);
		eq.signal(118173, 10);
		eq.signal(118174, 10);
		eq.signal(118175, 10);
		

	elseif(e.message:findi("dobbin assist me!") and pre_event == false) then
		e.self:Shout(eq.ChooseRandom(""..e.other:GetName().." is in need of yer help Dobbin. Bring yer men!","Dobbin, get yer men and c'mere on the double! "..e.other:GetName().." needs ye!"));
		eq.signal(118174, 10);
	elseif(e.message:findi("churn protect me!") and pre_event == false) then
		e.self:Shout("Churn, get yer men and c'mere on the double! "..e.other:GetName().." needs ye!");
		eq.signal(118171, 10);
	elseif(e.message:findi("corbin, attack!") and pre_event == false) then
		e.self:Shout(""..e.other:GetName().." is in need of yer help Corbin. Bring yer men!");
		eq.signal(118173, 10);
	end
end

function Master_Signal(e)
	if (e.signal == 1) then
		eq.spawn_condition("greatdivide", 0, 3, 1);
	elseif (e.signal == 2) then 
		-- Stop wave timer (if its running)
		eq.stop_timer('wave_cooldown');
		eq.set_timer('wave_cooldown', wave_cooldown_time);
	elseif(e.signal == 3) then	-- Event Failure
		Fail_Event();
		eq.set_timer("stop_event", stop_event_time);
	elseif(e.signal == 4) then	-- Event Success
		Win_Event();
		eq.set_timer("stop_event", stop_event_time);
	end
end

function Master_Timer(e)
	if (e.timer == 'wave_cooldown') then
		eq.stop_timer(e.timer);

		current_spawn_condition = current_spawn_condition + 1;

		eq.spawn_condition("greatdivide", 0, current_spawn_condition, 1);
		current_wave_number = current_spawn_condition;
	elseif(e.timer == "stop_event") then	-- Global Stop Event
		eq.stop_timer(e.timer);
		Stop_Event();
	end
end

function Seneschal_Spawn(e)
	if(pre_event == false) then
		e.self:Shout(" 'Good citizens of Thurgadin, hear me! Our city, our people, our very lives are in danger this day. The Kromrif are at this very moment marching towards us in an offensive they hope will bring about our demise...' ");

		e.self:Shout(" 'I hereby command, by authority of Dain Frostreaver the Fourth, that all able bodied Coldain fight to the death in defense of our land. Children, disabled citzens, and unseasoned travellers are advised to evacuate immediately!' ");

		e.self:Shout(" 'My fellow soldiers, take heart! For we are not alone in this endeavor. One among us, an outlander, has earned the title Hero of the Dain for valiant service to our people. This newcomer has brought with him allies that will fight alongside you to help bring about our victory.' ");

		e.self:Shout(" 'My friends... Brell did not place us here so many centuries ago to be slaughtered by these heathens. Nor did our forefather, Colin Dain, sacrifice himself simply to have us fail here now. Through these events we were brought to this day to test our strength and our faith.' ");

		e.self:Shout(" 'Will we be shackled together to slave away in Kromrif mines or will we stand united and feed these beasts Coldain blades? By Brell, I promise you, it is better to die on our feet than to live on our knees!' ");

		e.self:Shout(" 'TROOPS, TAKE YOUR POSITIONS!!' ");
	end
end

function Seneschal_Death(e)
	-- Event Fail
	-- Signal ringten to trigger Fail_Event and launch the reset timer.
	eq.signal(118170, 3);
end

function Seneschal_Signal(e)
	-- Narandi's Death
	if (e.signal == 1) then	
		e.self:Shout("Outlander! You've done it! The Kromrif invasion has been frustrated! Bring me the head of Narandi and your Hero's ring.");
	elseif(e.signal == 2 and pre_event == true) then
		e.self:Say("Very well, Garadain, the eastern post is yours. I'll place Kargin and his bowmen on the hill to the west, and Churn, you'll station your troops up near the caves just past them.");
		eq.signal(118171, 1);	-- Prompt an answer from Churn_the_Axeman
	elseif(e.signal == 3 and pre_event == true) then
		e.self:Say("Perfect timing outlander, please be seated and listen carefully. Badain, yer dismissed.");
		eq.signal(118067, 2);	-- Prompt an answer from Badain, who will leave the meeting.
	elseif(e.signal == 4 and pre_event == true) then
		e.self:Say("We knew the day might come when the Kromrif would discover the location of our beloved city. It was only prudent for there to be a plan for such a circumstance. In light of recent developments, however, our plans have been adjusted. Outlander, the Dain has appointed you to lead our armies in defense of Thurgadin.");
		e.self:Say("I will stand here with a handful of men as a final line of defense. Should I fall, all will be lost. You will have these men and their soldiers to command. Use them wisely, you will be richly rewarded if your forces are able to keep them alive.");
		e.self:Say("Garadain will post his men in the gorge to the east. Churn and his men will await your command in the caves to the west. Dobbin will have his forces at the ready in the clearing directly south of here near the towers. If any Kromrif make it to his vicinity he and his men will attack with or without your command.");
		e.self:Say("Lastly, Corbin will hide his men in the worm caves to the south, call on him for a surprise attack. Remember where these men are stationed, outlander. Should they call out for help you may wish to send some of your people to aid them.");
		e.self:Say("The leader of this invasion is a powerful Kromrif named Narandi. Rumor has it that he is more powerful than any ten of his peers. He must fall. When he is slain you must show his head and the ninth ring to me.");
		e.self:Say("Scout Zrelik here will follow you and serve as your herald. He will relay your orders to the troops. Show me your ninth ring now to verify your identity and I will give you the orders to memorize.");
	end
end

function Seneschal_Trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 1739, item2 = 30369})) then	-- Narandi's Head x1, Coldain Ring #9 x1
		e.self:Emote("unsheathes a knife and shaves the beard from Narandi's face and returns the head to you, 'The Dain will require the beard for his trophy room, please accept this ring on his behalf. May its effect aid you as you have aided us. Be certain to present the ring to the Dain when you're in town. If you remain an ally he will be most gracious, but be warned, if you fall from his good graces he will keep the ring.'");
		e.other:Faction(405,200,0);
		e.other:Faction(406,200,0);
		e.other:Faction(448,-200,0);
		e.other:Faction(419,-200,0);
		e.other:Ding();
		e.other:AddEXP(200000);
		e.other:SummonItem(1741);	-- Shorn Head of Narandi
		e.other:SummonItem(30385);	-- Ring of Dain Frostreaver IV
	elseif ((item_lib.check_turn_in(e.trade, {item1 = 30369})) and pre_event == true) then	-- Coldain Ring #9 x1
		e.other:SummonItem(30369);	-- Give back Coldain Ring #9
		e.other:SummonItem(18511);	-- Orders of Engagement
		e.self:Say("Commit these orders to memory, "..e.other:GetName()..", have them ready to speak at a moment's notice. When you are finished memorizing, repeat them to me. Tell your soldiers to prepare themselves. When the orders are handed to Zrelik we will take up our positions.");
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function WaveMaster_Death(e)
  -- Send a signal to the ringtenmaster that one of the WaveMasters has 
  -- died; start a 5min timer before the next wave is spawned.
  eq.signal(118170, 2);
end

function Narandi_Spawn(e)
	e.self:Shout("So you have defeated my foot soldiers, now come and face me you vile, filthy dwarven rabble...");
end

function Narandi_Death(e)
	e.self:Say("Rallos! Please accept my soul... I pray that you may find me worthy.");
	eq.signal(118166, 1);	-- Prompt Aldikar for a victory message.
	eq.signal(118170, 4);	-- Signal ringtenmaster of the victory, to start the final repop timer.
end

-- Hand in.: Shorn Head of Narandi (1741)
-- Get back: Crown of Narandi (1746)
-- Get back: Shorn Head of Narandi (1741)
function Churn_Trade(e)
  local item_lib = require("items");
  if (item_lib.check_turn_in(e.trade, {item1 = 1741})) then 
    e.other:SummonItem(1741);
    e.other:SummonItem(1746);

    e.self:Emote("pries a crown from the head of Narandi, 'The halls of Thurgadin will echo with praises to you for as long as we grace the face of this land. May this crown serve you well. Honor through battle!' ");

    e.self:Depop();
  end

  item_lib.return_items(e.self, e.other, e.trade);
end

-- Hand in.: Shorn Head of Narandi (1741)
-- Get back: Eye of Narandi (1745)
-- Get back: Shorn Head of Narandi (1741)
function Kargin_Trade(e)
  local item_lib = require("items");
  if (item_lib.check_turn_in(e.trade, {item1 = 1741})) then 
    e.other:SummonItem(1741);
    e.other:SummonItem(1745);

    e.self:Emote("picks up a stick and hits the back of the dismembered head with all his might, knocking one of its eyes out of the socket, 'Bastard killed my brother! Hope his ghost felt that one!' ");

    e.self:Depop();
  end

  item_lib.return_items(e.self, e.other, e.trade);
end

-- Hand in.: Shorn Head of Narandi (1741)
-- Get back: Earring of the Frozen Skull (1744)
-- Get back: Shorn Head of Narandi (1741)
function Corbin_Trade(e)
  local item_lib = require("items");
  if (item_lib.check_turn_in(e.trade, {item1 = 1741})) then 
    e.other:SummonItem(1741);
    e.other:SummonItem(1744);

    e.self:Emote("unhooks a glowing earring from Narandi's shorn head, 'Hmm, this looks like something special. Take it, " .. e.other:GetName() .. ", you've earned it! Be well.' ");

    e.self:Depop();
  end

  item_lib.return_items(e.self, e.other, e.trade);
end

-- Hand in.: Shorn Head of Narandi (1741)
-- Get back: Faceguard of Bentos the Hero (1743)
-- Get back: Shorn Head of Narandi (1741)
function Dobbin_Trade(e)
  local item_lib = require("items");
  if (item_lib.check_turn_in(e.trade, {item1 = 1741})) then 
    e.other:SummonItem(1741);
    e.other:SummonItem(1743);

    e.self:Emote("gives a gentle, warm smile and slight nod of his head in warm welcoming, 'Good day to you, " .. e.other:GetName() .. ", and welcome to the district of Selia. We are children of the light -- beings who valiantly uphold the ways of honor, valor, and merits of goodly faith and virtue. Rather, we are crusaders of these things, collectively comprising the beacon of these traits within the universe in our position in New Tanaan. We are quite pleased to have you approach us with such confidence -- perhaps the inner light has brought you to us, seeking a way to unlock the purity of these merits that you faintly mirror now. If you are seeking council in the ways of enchantments, then I would be more than pleased and honored to aid you where I can, my friend.'");

    e.self:Depop();
  end

  item_lib.return_items(e.self, e.other, e.trade);
end

-- Hand in.: Shorn Head of Narandi (1741)
-- Get back: Choker of the Wretched (1742)
-- Get back: Shorn Head of Narandi (1741)
function Garadain_Trade(e)
  local item_lib = require("items");
  if (item_lib.check_turn_in(e.trade, {item1 = 1741})) then 
    e.other:SummonItem(1741);
    e.other:SummonItem(1742);

    e.self:Emote("removes a choker from the severed head and returns both items to you, 'Congratulations on your victory, " .. e.other:GetName() .. ". I couldn't have done a better job myself. May Brell protect and watch over you and your friends. Farewell.'");

    e.self:Depop();
  end

  item_lib.return_items(e.self, e.other, e.trade);
end

function Zrelik_Trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 18511})) then
		e.self:Say("At yer service, "..e.other:GetName()..". Remember now, before issuing me an order ya must disengage from any combat and be sure yer speakin to me. I advise you to avoid combat at all costs, your leadership is crucial.");
		e.self:SetRunning(true);
		e.self:SetFollowID(e.other:GetID());
		-- Final manual depop of all Council NPCs before kicking off the main War Event.
		eq.depop_all(118171);	-- Churn_the_Axeman
		eq.depop_all(118172);	-- Kargin_the_Archer
		eq.depop_all(118173);	-- Corbin_Blackwell
		eq.depop_all(118174);	-- Dobbin_Crossaxe
		eq.depop_all(118175);	-- Garadain_Glacierbane
		eq.depop_all(118166);	-- Aldikar
		
		Start_Event();
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function Giants_Spawn(e)
	e.self:Shout(string.format("DEBUG: Doing Phase %s", current_wave_number));
end

-- Giving Sentry Badain the Declaration of War & the Ring #9 triggers a pre-event where a council of Coldains
-- will take place near Thurgadin.
function Badain_Trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 1567, item2 = 30369})) then	-- Declaration of War x1, Coldain Ring #9 x1
		e.other:SummonItem(30369);	-- Give back Ring #9
		e.self:Emote("breathes deeply and blows into an ornate horn. The sound echos through the mountain pass. All local inhabitants scurry to take cover.");
		e.self:Say("I'll be right with you, "..e.other:GetName()..".");
		e.self:Say("Excellent! All of your commanders have reported to the Dain, and none too soon mind you. We are getting reports of Kromrif troop movement in the area and final preparations must be made. Follow me and the Seneschal will brief you.");
		
		-- Spawn the Coldain Council
		eq.spawn2(118171, 0, 0, -120, -536, 74, 340);	-- Churn_the_Axeman
		eq.spawn2(118172, 0, 0, -116, -543, 73, 368);	-- Kargin_the_Archer
		eq.spawn2(118173, 0, 0, -121, -568, 71, 438);	-- Corbin_Blackwell
		eq.spawn2(118174, 0, 0, -134, -580, 70, 481);	-- Dobbin_Crossaxe
		eq.spawn2(118175, 0, 0, -149, -582, 70, 6);		-- Garadain_Glacierbane
		eq.spawn2(118166, 0, 0, -145, -547, 73, 185)	-- Seneschal Aldikar
		eq.spawn2(118177, 0, 0, -129, -528, 74, 311)	-- Zrelik
		
		badain_pre_event_wp_1 = true;
		e.self:MoveTo(-144, -534, 76,263, true);
	end
end

function Badain_Waypoint(e)
	if(badain_pre_event_wp_1 == true) then
		eq.set_timer('badain_salute', 2000);
	elseif(badain_pre_event_wp_2 == true) then
		e.self:Depop(true);
	end
end

function Badain_Timer(e)
	if (e.timer == 'badain_salute') then
		eq.stop_timer(e.timer);
		e.self:DoAnim(67);
		-- Start the Coldain Council Convo with Garadain_Glacierbane.
		eq.signal(118175, 1);
	elseif(e.timer == 'badain_dismissed') then
		eq.stop_timer(e.timer);
		eq.set_timer('badain_leave', 2000);
	elseif(e.timer == 'badain_leave') then
		eq.stop_timer(e.timer);
		e.self:DoAnim(67);
		e.self:Say("Sir, yessir!");
		badain_pre_event_wp_1 = false;
		badain_pre_event_wp_2 = true;
		e.self:MoveTo(-130, -92, 94,19, true);
		-- Resume the Council Convo with Aldikar
		eq.signal(118166, 4);
	end
end

function Badain_Signal(e)
	if(e.signal == 1 and pre_event == true) then
		e.self:Say("Excuse me, Seneschal Aldikar, you instructed me to report to you when the outlander returned. I have brought him.");
		eq.signal(118166, 3);	-- Prompt an answer from Aldikar
	elseif(e.signal == 2 and pre_event == true) then
		eq.set_timer('badain_dismissed', 2000);
	end
	
end

function Garadain_Signal(e)
	if(e.signal == 1 and pre_event == true) then
		e.self:Say("With all due respect, Seneschal, I feel my men are best suited for the eastern post. If the outlander has rounded up enough soldiers to hold 'em off from the south then they'll definitely test us in the gorge. We'll be needin' a solid defense there.");
		eq.signal(118166, 2);	-- Prompt an answer from Aldikar
	elseif(e.signal == 10) then
		e.self:Shout("Hold 'em off, outlander. We'll be right there!");
		eq.signal(118135, 10);	-- Signal Royal Clerics to come to the rescue
		eq.signal(118151, 10);
		e.self:SetRunning(true);
		e.self:MoveTo(current_x_position + math.random(1,10), current_y_position + math.random(1,10), current_z_position,0, true);
	end
end

function Churn_Signal(e)
	if(e.signal == 1 and pre_event == true) then
		e.self:Say("Understood sir.");
		eq.signal(118067, 1);	-- Prompt an answer from Badain
	elseif(e.signal == 10) then
		e.self:Shout("Hold 'em off, outlander. We'll be right there!");
		eq.signal(118161, 10);	-- Signal Royal Axemen to come to the rescue
		e.self:SetRunning(true);
		e.self:MoveTo(current_x_position + math.random(1,10), current_y_position + math.random(1,10), current_z_position,0, true);
	end
end

function Dobbin_Signal(e)
	if(e.signal == 10) then
		e.self:Shout("Hold 'em off, outlander. We'll be right there!");
		eq.signal(118211, 10);	-- Signal Royal Guards to come to the rescue
		eq.signal(118134, 10);	
		e.self:SetRunning(true);
		e.self:MoveTo(current_x_position + math.random(1,10), current_y_position + math.random(1,10), current_z_position,0, true);
	end
end

function Corbin_Signal(e)
	if(e.signal == 10) then
		e.self:Shout("Hold 'em off, outlander. We'll be right there!");
		eq.signal(118140, 10);	-- Signal Royal Soldiers to come to the rescue
		eq.signal(118131, 10);	
		e.self:SetRunning(true);
		e.self:MoveTo(current_x_position + math.random(1,10), current_y_position + math.random(1,10), current_z_position,0, true);
	end
end

function Kargin_Signal(e)
	if(e.signal == 10) then
		e.self:Shout("Hold 'em off, outlander. We'll be right there!");
		eq.signal(118141, 10);	-- Signal Royal Archers to come to the rescue
		eq.signal(118212, 10);	
		e.self:SetRunning(true);
		e.self:MoveTo(current_x_position + math.random(1,10), current_y_position + math.random(1,10), current_z_position,0, true);
	end
end

-- Add a bit of diversity to male & female coldains :-)
function Coldains_Spawn(e)
	local randomface = require("random_face");
	randomface.RandomFace(e.self, eq);
end

function Coldains_Signal(e)
	if(e.signal == 10) then
		e.self:SetRunning(true);
		e.self:MoveTo(current_x_position + math.random(1,10), current_y_position + math.random(1,10), current_z_position,0, true);
	end
end

-- This function will check the current waypoint reached by any Kromrif.
-- If the last waypoint for a given grid is reached, it means failure and will trigger the end of the event.
function Giants_Waypoint(e)
	if(e.self:GetGrid() == 59) then 	-- grid 59 goes from number 1 to 8
		if(e.wp == 8) then
			-- Signal ringten to trigger Fail_Event and launch the reset timer.
			eq.signal(118170, 3);
		end
	elseif(e.self:GetGrid() == 60) then	-- grid 60 goes from number 1 to 5
		if(e.wp == 5) then
			-- Signal ringten to trigger Fail_Event and launch the reset timer.
			eq.signal(118170, 3);
		end
	elseif(e.self:GetGrid() == 61) then	-- grid 61 goes from number 1 to 4
		if(e.wp == 4) then
			-- Signal ringten to trigger Fail_Event and launch the reset timer.
			eq.signal(118170, 3);
		end
	end
end

function event_encounter_load(e)
	-- General system events
	eq.register_npc_event('ring_war', Event.spawn,          118170, Master_Spawn);
	eq.register_npc_event('ring_war', Event.signal,         118170, Master_Signal);
	eq.register_npc_event('ring_war', Event.timer,          118170, Master_Timer);

	-- Sentry Badain: War pre-event
	eq.register_npc_event('ring_war', Event.trade,			118067, Badain_Trade);
	eq.register_npc_event('ring_war', Event.waypoint_arrive,118067, Badain_Waypoint);
	eq.register_npc_event('ring_war', Event.timer,			118067, Badain_Timer);	
	eq.register_npc_event('ring_war', Event.signal,			118067, Badain_Signal);

	-- Zrelik: War event starter
	eq.register_npc_event('ring_war', Event.say,            118177, Zrelik_Say);
	eq.register_npc_event('ring_war', Event.trade,          118177, Zrelik_Trade);

	-- Aldikar
	eq.register_npc_event('ring_war', Event.spawn,          118166, Seneschal_Spawn);
	eq.register_npc_event('ring_war', Event.death_complete, 118166, Seneschal_Death);
	eq.register_npc_event('ring_war', Event.signal,			118166, Seneschal_Signal);
	eq.register_npc_event('ring_war', Event.trade,			118166, Seneschal_Trade);

	-- Misc Giants
	-- Kromrif High Priest
	eq.register_npc_event('ring_war', Event.spawn,		  	118210, Giants_Spawn);
	eq.register_npc_event('ring_war', Event.waypoint_arrive,118210, Giants_Waypoint);
	-- Kromrif Priest
	eq.register_npc_event('ring_war', Event.spawn,		  	118209, Giants_Spawn);
	eq.register_npc_event('ring_war', Event.waypoint_arrive,118209, Giants_Waypoint);
	-- Kromrif Recruit
	eq.register_npc_event('ring_war', Event.spawn,		  	118160, Giants_Spawn);
	eq.register_npc_event('ring_war', Event.waypoint_arrive,118160, Giants_Waypoint);
	-- Kromrif Spearman
	eq.register_npc_event('ring_war', Event.spawn,		  	118138, Giants_Spawn);
	eq.register_npc_event('ring_war', Event.waypoint_arrive,118138, Giants_Waypoint);
	-- Kromrif Veteran
	eq.register_npc_event('ring_war', Event.spawn,		  	118156, Giants_Spawn);
	eq.register_npc_event('ring_war', Event.waypoint_arrive,118156, Giants_Waypoint);
	-- Kromrif Warrior
	eq.register_npc_event('ring_war', Event.spawn,		  	118150, Giants_Spawn);
	eq.register_npc_event('ring_war', Event.waypoint_arrive,118150, Giants_Waypoint);
	
	-- Kromrif Captain's Death & misc
	eq.register_npc_event('ring_war', Event.spawn,		  	118130, Giants_Spawn);
	eq.register_npc_event('ring_war', Event.death_complete, 118130, WaveMaster_Death);
	eq.register_npc_event('ring_war', Event.waypoint_arrive,118130, Giants_Waypoint);
	-- Kromrif General's Death & misc
	eq.register_npc_event('ring_war', Event.spawn,		  	118120, Giants_Spawn);
	eq.register_npc_event('ring_war', Event.death_complete, 118120, WaveMaster_Death);
	eq.register_npc_event('ring_war', Event.waypoint_arrive,118120, Giants_Waypoint);
	-- Kromrif Warlord's Death & misc
	eq.register_npc_event('ring_war', Event.spawn,		  	118158, Giants_Spawn);
	eq.register_npc_event('ring_war', Event.death_complete, 118158, WaveMaster_Death);
	eq.register_npc_event('ring_war', Event.waypoint_arrive,118158, Giants_Waypoint);

	-- Narandi's Death
	eq.register_npc_event('ring_war', Event.death_complete, 118145, Narandi_Death);
	eq.register_npc_event('ring_war', Event.spawn,          118145, Narandi_Spawn);

	-- Loot Mobs
	eq.register_npc_event('ring_war', Event.trade,          118171, Churn_Trade);
	eq.register_npc_event('ring_war', Event.trade,          118172, Kargin_Trade);
	eq.register_npc_event('ring_war', Event.trade,          118173, Corbin_Trade);
	eq.register_npc_event('ring_war', Event.trade,          118174, Dobbin_Trade);
	eq.register_npc_event('ring_war', Event.trade,          118175, Garadain_Trade);
	
	
	eq.register_npc_event('ring_war', Event.signal,			118175, Garadain_Signal);
	eq.register_npc_event('ring_war', Event.signal,         118171, Churn_Signal);
	eq.register_npc_event('ring_war', Event.signal,			118174, Dobbin_Signal);
	eq.register_npc_event('ring_war', Event.signal,			118173, Corbin_Signal);
	eq.register_npc_event('ring_war', Event.signal,			118172, Kargin_Signal);
	
	-- Misc Coldains (Axeman, Soldier, Royal Guard, Archer, Cleric)

	-- Dobbin's Royal Guard Squad
	eq.register_npc_event('ring_war', Event.spawn,			118211, Coldains_Spawn);
	eq.register_npc_event('ring_war', Event.spawn,			118134, Coldains_Spawn);
	eq.register_npc_event('ring_war', Event.signal,			118211, Coldains_Signal);
	eq.register_npc_event('ring_war', Event.signal,			118134, Coldains_Signal);
	
	-- Garadain's Royal Cleric Squad
	eq.register_npc_event('ring_war', Event.spawn,			118135, Coldains_Spawn);
	eq.register_npc_event('ring_war', Event.spawn,			118151, Coldains_Spawn);
	eq.register_npc_event('ring_war', Event.signal,			118135, Coldains_Signal);
	eq.register_npc_event('ring_war', Event.signal,			118151, Coldains_Signal);
	
	-- Corbin's Royal Soldier Squad
	eq.register_npc_event('ring_war', Event.spawn,			118140, Coldains_Spawn);
	eq.register_npc_event('ring_war', Event.spawn,			118131, Coldains_Spawn);
	eq.register_npc_event('ring_war', Event.signal,			118140, Coldains_Signal);
	eq.register_npc_event('ring_war', Event.signal,			118131, Coldains_Signal);
	
	-- Kargin's Royal Archer Squad
	eq.register_npc_event('ring_war', Event.spawn,			118141, Coldains_Spawn);
	eq.register_npc_event('ring_war', Event.spawn,			118212, Coldains_Spawn);
	eq.register_npc_event('ring_war', Event.signal,			118141, Coldains_Signal);
	eq.register_npc_event('ring_war', Event.signal,			118212, Coldains_Signal);
	
	-- Churn's Royal Axeman Squad
	eq.register_npc_event('ring_war', Event.spawn,			118161, Coldains_Spawn);
	eq.register_npc_event('ring_war', Event.signal,			118161, Coldains_Signal);

	
end

function event_encounter_unload(e)
  Stop_Event();
end
