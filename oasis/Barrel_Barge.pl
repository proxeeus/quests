sub EVENT_WAYPOINT_ARRIVE
{
	if($wp == 3)	# signal TD's watcher to spawn the Barrel Barge
	{
		quest::crosszonesignalnpcbynpctypeid(96353,5);
		quest::shout2("Barge a TD stp");
	}
	elsif($wp == 4)	# signal TD's watcher to set the Barge on its grid
	{
		quest::crosszonesignalnpcbynpctypeid(96353, 6); 
		quest::pause(3);
		quest::depop(37070);
		quest::shout("alle salu");
	}
}

sub EVENT_SIGNAL
{
	if($signal == 1)
	{
		quest::start(107);
	}
}