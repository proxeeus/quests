-----
--
-- Gynok Moltor spawns/PH fluff messages
--
-----

-- ice_boned_skeleton

function event_spawn(e)
  e.self:Shout("Grrrraaaaaaaaugggggh! You have disturbed my rest! Now suffer as I have!");
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Areeeeewwwww!");
	end
end
