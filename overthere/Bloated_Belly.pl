sub EVENT_WAYPOINT_ARRIVE
{
	if($wp == 4)	# signal TD Boatwatcher to spawn the Belly.
	{
		quest::crosszonesignalnpcbynpctypeid(96353 , 3);
	}
	elsif($wp == 9)
	{
		quest::crosszonesignalnpcbynpctypeid(96353 , 4); # signal TD Boatwatcher to start Bloated Belly's grid
		quest::pause(3);
		quest::depop(93176);
	}
}

sub EVENT_SIGNAL
{
	if($signal == 1)	# start pathing into OT
	{
		quest::start(272);
	}
}