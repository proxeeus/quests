function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("shows the signs of a great mystic. You can feel power resonating from his aura. 'Greetings and may the cursed blessings of Cazic-Thule be yours. What may I do for you this fine evening? Perhaps I can [cure disease] or [heal] you, perhaps even [purge toxins] from your system?");
	elseif(e.message:findi("cure disease")) then
		e.self:CastSpell(213,e.other:GetID());
	elseif(e.message:findi("heal")) then
		e.self:CastSpell(12,e.other:GetID());
	elseif(e.message:findi("purge toxins")) then
		e.self:CastSpell(203,e.other:GetID());
	elseif(e.message:findi("crusaders of rok nolok") or e.message:findi("crusaders of rok nilok")) then
		e.self:Emote("lowers his head in sorrow. 'Let us have a moment of peace. I cannot find the words to describe the unspeakable act of the gods which took the lives of the legendary Crusaders of Rok Nilok. You must find the answers for yourself. All I can do is await their return.'");
	end
end



function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 12736, item2 = 5143})) then
		e.self:Say("Let me hold within my hands the full box of the C.O.R.N. Caste and your iron cudgel of the Seer. Only then may you hold the iron cudgel of the Prophet.");
		e.self:Emote("'s voice booms loudly and does not sound the same as before. 'You have brought the skulls back to the empire. For this you shall be rewarded. You are now a prophet of the Temple of Terror. Go and find the Skulls of Di Nozok. I shall wait within Zand. Bring them along with your iron cudgel of the prophet.'");
		e.other:Faction(445,10,0); -- Scaled Mystics
		e.other:Faction(441,10,0); -- Legion of Cabilis
		e.other:Ding();
		e.other:AddEXP(10000);
		e.other:SummonItem(5144);
	else
		item_lib.return_items(e.self, e.other, e.trade);
	end
end
	