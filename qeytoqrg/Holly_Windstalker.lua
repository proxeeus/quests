function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Well met. %s.  I am Holly Windstalker. Protector of the Pine.  What brings you out to the Qeynos Hills?  Not hunting. I hope. These stains on my blade are all that is left of the last adventurer I caught harming my bear and wolf friends.",e.other:GetName()));
	end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Natural selection at work.");
	end
end