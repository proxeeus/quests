# Timorous Island Shuttle To Butcher C

sub EVENT_WAYPOINT_ARRIVE
{
	if($wp == 6)
	{
		quest::crosszonesignalnpcbynpctypeid(68315 , 5); # signal BBM boatmaster to update his skiffC var
		quest::pause(3);
		quest::depop(96357);
	}
}

sub EVENT_WAYPOINT_DEPART
{
	if($wp == 5)
	{
		quest::signalwith(96301, 5);
	}
}

sub EVENT_SIGNAL
{
	if($signal == 1)
	{
		quest::start(36);
	}
}