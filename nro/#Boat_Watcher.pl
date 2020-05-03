
sub EVENT_SPAWN
{
	quest::debugshout("Watcher NRO spawned");
}

sub EVENT_SIGNAL
{
	# signal from ICECLAD, spawn the skiff and set it on the correct grid
	if($signal == 1)
	{
		quest::debugshout("Got a signal from Iceclad, spawning the skiff in Nro!");
		quest::spawn2(34107, 86, 0, -1141, 1313, -1.94, 238);
	}
}