sub EVENT_WAYPOINT_ARRIVE
{
	if($wp == 4)	# signal TD's watcher to spawn the Barrel Barge
	{
		quest::crosszonesignalnpcbynpctypeid(37160,1);
	}
	elsif($wp == 5)	# signal TD's watcher to set the Barge on its grid
	{
		quest::crosszonesignalnpcbynpctypeid(37160, 2); 
		quest::pause(3);
		quest::depop(96316);
	}
}

sub EVENT_SIGNAL
{
	if($signal == 1)
	{
		quest::start(39);
	}
}