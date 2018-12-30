# Timorous Island Shuttle To Butcher A

sub EVENT_WAYPOINT_ARRIVE
{
	if($wp == 6)
	{
		quest::crosszonesignalnpcbynpctypeid(68315 , 6); # signal BBM boatmaster to update his skiffD var
		quest::depop(96358);
	}
}

sub EVENT_SIGNAL
{
	if($signal == 1)
	{
		quest::start(37);
	}
}