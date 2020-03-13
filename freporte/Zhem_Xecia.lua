function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What is it maggot? I have only time for new clerics who have chosen to [serve the Dismal Rage]. If you are looking for meaningless banter, then I suggest you find a bar wench.");
	elseif(e.message:findi("serve the dismal rage")) then
		e.self:Say("The clerics of the Dismal Rage must be strong and familiar with battle. There are many beings across Norrath who oppose our deity and our dogma. Take this note to Jerra Renlock and she will aid you in obtaining a suit of armor to protect you from the physical threats of our enemies and the creatures of the wild.  Once you have been properly outfitted return to me and will offer you [further instruction].");
		e.other:SummonItem(19844); -- Note to Jerra Renlock
	elseif(e.message:findi("further instruction")) then
		e.self:Say("So you think you are ready to face the enemies of the Dismal Rage? Be careful to not be blinded by your arrogance or anger. You must focus the rage in your soul and refine it into patient and insidious hatred. A cleric of the Sentries of Passion, Ulia Yovar, has been attempting to uncover our allies among the citizens of Freeport and is believed to be in hiding in the sewer tunnels under the western quarter of Freeport. Seek this enemy of the Dismal Rage and bring me her head.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 19933})) then
		e.self:Say("I see your mission was a success. Take this Rough Dismal Flail and refine it in forge with a sharpening stone. It may take you several attempts if you are unfamiliar with the process. Once that is done take the Refined Dismal Flail and a Giant Rattlesnake Skin to Jerra Renlock. She will put the finishing touches on your new weapon.");
		--e.other:SummonItem(19939);
		e.other:SummonItem(19922);
		e.other:Ding();
		e.other:AddEXP(1000);
		e.other:Faction(271,100,0); -- Dismal Rage
		e.other:Faction(281,-15,0); -- Knights of Truth
		e.other:Faction(296,20,0); -- Opal Dark Briar
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
