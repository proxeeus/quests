sub EVENT_SPAWN
{
	quest::debugshout("Pirate runner's skiff NRO spawned");
}

sub EVENT_WAYPOINT_ARRIVE
{
	quest::debugshout("NRO Skiff at waypoint $wp.");
	if($wp == 3)
	{
		# signal Iceclad's Boat Watcher to spawn the skiff
		quest::crosszonesignalnpcbynpctypeid(110118,1);
	}
}