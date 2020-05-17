function event_timer(e)
	if(e.timer == "glug1") then
		eq.stop_timer(e.timer);
		e.self:DoAnim(58);
		eq.set_timer("glug2", 5000);
	elseif(e.timer == "glug2") then
		eq.stop_timer(e.timer);
		e.self:DoAnim(58);
		eq.set_timer("glug3", 5000);	
	elseif(e.timer == "glug3") then
		eq.stop_timer(e.timer);
		e.self:DoAnim(21);
		eq.set_timer("glug4", 5000);
	elseif(e.timer == "glug4") then
		eq.spawn2(116606,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		e.self:Depop(true);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 1459})) then
		e.self:Say("You gotta be kiddin me, Avalanche Ale? Haven't had a bottle a this stuff in ages. Brell bless you, "..e.other:GetName().."! Glug, glug, glug...");
		eq.set_timer("glug1", 5);
	end
	
	item_lib.return_items(e.self, e.other, e.trade, e.text)
end

function event_combat(e)
	if(e.joined) then
		e.self:Shout("Yer messin with the wrong Coldain, prepare ta meet yer ancestors!");
		-- grab the entity list
		local entity_list = eq.get_entity_list();
		-- also aggro Murdrick's buddies
		local npc_table = {116060,116059, 116061,116100};
		for k,v in pairs(npc_table) do
			local npc = entity_list:GetMobByNpcTypeID(v);
			if (npc.valid) then
				npc:AddToHateList(e.other,1);
			end
		end
	end
end