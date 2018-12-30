# Timorous Island Shuttle To Butcher A

sub EVENT_WAYPOINT_ARRIVE
{
	if($wp == 10)
	{
		quest::crosszonesignalnpcbynpctypeid(68315 , 5); # signal BBM boatmaster to update his skiffC var
		quest::depop(96357);
	}
}

sub EVENT_SIGNAL
{
	if($signal == 1)
	{
		quest::start(36);
	}
}