# Timorous Island Shuttle To Butcher D

sub EVENT_WAYPOINT_ARRIVE
{
	if($wp == 9) #was 6
	{
		quest::crosszonesignalnpcbynpctypeid(68315 , 6); # signal BBM boatmaster to update his skiffD var
		quest::pause(3);
		quest::depop(96358);
	}
}

sub EVENT_WAYPOINT_DEPART
{
	if($wp == 4)
	{
		quest::signalwith(96301, 6);
	}
}

sub EVENT_SIGNAL
{
	if($signal == 1)
	{
		quest::start(37);
	}
}