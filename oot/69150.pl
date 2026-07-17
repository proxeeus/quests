# Boat Watcher for Ocean of Tears
# Is in charge of spawning a boat when signaled FROM East Freeport (signal 1)
# Is in charge of spawning a boat when signaled FROM Butcherblock Mountains (signal 2)

sub EVENT_SPAWN
{
	quest::debugshout("WATCHER SPAWNED");
}

sub EVENT_SIGNAL
{
	if($signal == 1)	# Coming from FP
	{
		quest::shout("The Siren's Bane just left Freeport, it should arrive to the Sisters Island shortly!");
		#used to be -41
		quest::spawn2(69153, 63, 0, -10583, -3169, -20, 0);
	}
	elsif($signal == 2)	# Coming from BB
	{
		quest::shout("The Siren's Bane just left Butcherblock Mountains!");
		#used to be -41
		quest::spawn2(69153, 62, 0, 10784, 1151, -20, 0);
	}
}