sub EVENT_SPAWN
{
	quest::debugshout("Pirate runner's skiff ICECLAD spawned");
}

sub EVENT_WAYPOINT_ARRIVE
{
	quest::debugshout("ICECLAD Skiff at waypoint $wp.");
	if($wp == 7)
	{
		# signal NRO's Boat Watcher to spawn the skiff
		quest::crosszonesignalnpcbynpctypeid(34149,1);
	}
}