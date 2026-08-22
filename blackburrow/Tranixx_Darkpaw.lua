function event_combat(e)
	if(e.joined) then
		e.self:Say(
			(eq.ChooseRandom("YAP! YAP! YAP! In the way of my father, I claim your blood for the glory of Blackburrow!! WOOOOOOOF!!",
					"You have trespassed long enough on Sabertooth land!")));
		e.self:Shout("I, Tranixx Darkpaw, have embraced the dark powers of Bertoxxulous to rid you from our land!");
	end
end
