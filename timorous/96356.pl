# Timorous Island Shuttle To Butcher B

sub EVENT_WAYPOINT_ARRIVE
{
	if($wp == 11)
	{
		quest::crosszonesignalnpcbynpctypeid(68315 , 4); # signal BBM boatmaster to update his skiffB var
		quest::depop(96356);
	}
}

sub EVENT_SIGNAL
{
	if($signal == 1)
	{
		quest::start(35);
	}
}