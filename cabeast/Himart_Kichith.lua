function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings young one, I am Himart Kichith, shaman of the Scaled Mystics and storekeeper of valuable knowledge of the past. I am always looking for knowledge of the past in the form of spells and [rare scrolls]. If you are interested in a tidy profit perhaps you would be willing to help me.");
	end
end

function event_trade(e)
	local item_lib =require("items");
	if((item_lib.check_turn_in(e.trade, {item1 = 19272})) or
		(item_lib.check_turn_in(e.trade, {item1 = 19269})) or
		(item_lib.check_turn_in(e.trade, {item1 = 19238})) or
		(item_lib.check_turn_in(e.trade, {item1 = 19264})) 
	) then
    e.self:Say("Most excellent, ".. e.other:GetName().. ". As promised, here is an ancient piece of knowledge. May you use it well !");
    e.other:Ding();
    e.other:SummonItem(eq.ChooseRandom(19266, 19271,19267,19274));
    e.other:AddEXP(200);
  end
  item_lib.return_items(e.self, e.other, e.trade, e.text)
end
