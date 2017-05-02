function event_spawn(e)
  e.self:Shout("BBBBBAAAARRRKKKK!!!!!  You humans will pay for ruining our homeland!!  GRRRRRRRR!!!!  Family Darkpaw of the Sabretooth Clan will slay you all!!  BARK! ");
  e.self:SetRunning(true);
end

function event_combat(e)
	e.self:Say(
		(eq.ChooseRandom("YAP! YAP! YAP! In the way of my father, I claim your blood for the glory of Blackburrow!! WOOOOOOOF!!",
				"You have trespassed long enough on Sabertooth land!")));
end
