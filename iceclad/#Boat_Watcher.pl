
sub EVENT_SPAWN
{
	quest::debugshout("Watcher Iceclad spawned");
}

sub EVENT_SIGNAL
{
	# signal from NRO
	if($signal == 1)
	{
		# spawn pirate runner's skiff + set it on the correct grid
		quest::spawn2(110085, 55, 0, -23000, 6446, -39, 247);
	}
}