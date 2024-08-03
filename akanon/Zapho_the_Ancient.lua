-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh! Please excuse me. I was busy creating some new illusions for my collection. Hello there, " .. e.other:GetName() .. "! I am Zapho the Ancient. My return from the halls of the Realm of Heroes is the will of Bertoxxulous. I must watch over those who catch the eyes of the gods and recognize their heroic deeds.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end

function event_combat(e)
    if(e.joined == true) then
      e.self:Say("Time to die, " .. e.other:GetName() .. ".");
    end
  end
  