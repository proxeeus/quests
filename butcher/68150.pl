# Skiff to Timorous Deep

sub EVENT_WAYPOINT_ARRIVE
{
	#quest::shout2("Je suis au waypoint $wp dans $zonesn !");
	if($wp == 5)	
	{
		quest::depop(68150);
	}
	#elsif($wp == 15)
	#{
	#	# Last WP. We need to despawn the current boat.
	#	quest::depop(68228);
	#}
}

sub EVENT_SIGNAL
{
	if($signal == 1) # Signal from Timorous Deep that it's time to get going
	{
		quest::shout2("Arr we be goin' !");
		quest::start(238);
	}
}


