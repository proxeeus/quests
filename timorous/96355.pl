# Timorous Island Shuttle To Butcher A

sub EVENT_WAYPOINT_ARRIVE
{
	if($wp == 8)
	{
		quest::crosszonesignalnpcbynpctypeid(68315 , 3); # signal BBM boatmaster to update his skiffA var
		quest::depop(96355);
	}
}

sub EVENT_WAYPOINT_DEPART
{
	if($wp == 4)
	{
		quest::shout2("On se casse de TD la, on pop les Shuttles dans BBM!");
		quest::crosszonesignalnpcbynpctypeid(68315 , 2); # signal BBM boatmaster to spawn the skiffs in BBM
	}
}

sub EVENT_SIGNAL
{
	if($signal == 1)
	{
		quest::start(34);
	}
}