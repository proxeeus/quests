#This is more for flavor than anything, and isn't really required

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("So, you've come. I suppose my brothers have sent you to lead me back to their flock. Those fools are so blinded by their devotion they know nothing of life. If they only knew the power I've become, the luxuries I've amassed, the pleasures I've known, they too would leave that sour and unrewarding existence in seconds. You know, you could come to know what I have, shaman. You found me, which speaks of your intelligence; we could use you. What do you say, "..e.other:GetName().."? [Will you join] my master Mayong Mistmoore?");
	elseif(e.message:findi("will not join")) then
		e.self:Say("Good shaman, now bare your neck that I may show our master your devotion in death. The more blood you spill upon the grass, the more impressed our Lord Mistmoore will be. Then maybe, just maybe, you will be allowed to scour our kitchen floors in the eternity of unlife. TEAR him to pieces, my wolves!");
		e.self:AddToHateList(e.other, 1);
		-- eq.get_entity_list():GetNPCByNPCTypeID(59066):AddToHateList(e.other, 1);
		local entity_list = eq.get_entity_list();
		local npc_list = entity_list:GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid) then
				if(npc:GetNPCTypeID() == 59066) then
					npc:AddToHateList(e.other, 1);
				end
			end
		end
	end
end
