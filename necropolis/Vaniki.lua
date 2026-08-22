function event_combat(e)
	if(e.joined) then
		e.self:Say("Yitititi!  Look!  Aiyi, maka rik ro ne vis ka Vaniki!  Someone dares challenge Vaniki!");
	end
end

function event_death_complete(e)
	e.self:Say("yiyiyi...Vaniki sa mo nis raka ma. aaaah...Vaniki dies, but so do you!");
end

function event_slay(e)
	e.self:Say("Waniki so vi no takarika Vaniki.  Who shall fall next to Vaniki?");
end
