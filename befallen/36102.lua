-----
--
-- Gynok Moltor spawns/PH fluff messages
-- This is the actual Gynok NPC
--
-----

function event_spawn(e)
  e.self:Shout("Grrrraaaaaaaaugggggh! You have disturbed my rest! Now suffer as I have!");
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Oooohhh... Arghhh... Yooouuu sssshhhalll neeeveer ffffiiinnnd the paaawwww...");
	end
end

function event_death_complete(e)
	e.self:Say("Aaaatt laaasssssstttt! Opolla's cuuurrsssee is lifted!");
end