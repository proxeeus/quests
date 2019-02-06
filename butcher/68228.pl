# Siren's Bane Butcherblock to OOT

sub EVENT_WAYPOINT_ARRIVE
{
	quest::debugshout("Je suis au waypoint $wp dans $zonesn !");
	if($wp == 11)	
	{
		quest::crosszonesignalnpcbynpctypeid(69150, 2);
	}
	elsif($wp == 15)
	{
		# Last WP. We need to despawn the current boat.
		quest::depop(68228);
	}
}


