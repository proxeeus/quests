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
		quest::spawn2(69153, 63, 0, -10583, -3169, -41, 0);
	}
	elsif($signal == 2)	# Coming from BB
	{
		quest::shout("The Siren's Bane just left Butcherblock Mountains!");
		quest::spawn2(69153, 62, 0, 10784, 1151, -41, 0);
	}
}