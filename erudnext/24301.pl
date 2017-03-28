# Sea King boat

sub EVENT_SPAWN
{
	quest::signalwith(24056 , 1);	# Signals Sabrina to start its route
}

sub EVENT_SIGNAL
{
	if($signal == 1)
	{
		quest::start(23);
		
		quest::signalwith(24056 , 2);	# Signals Sabrina to update its internal variable to stop its course once back at the dock
	}
}



sub EVENT_WAYPOINT_ARRIVE
{
	if($wp == 2)
	{
		quest::crosszonesignalnpcbynpctypeid(98057,1);
		
	}
	elsif($wp == 3)
	{
		quest::depop(24301);
	}
}