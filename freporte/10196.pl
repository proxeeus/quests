# Siren's Bane script for East Freeport.

sub EVENT_WAYPOINT_ARRIVE
{
	quest::debugshout("Je suis au waypoint $wp dans $zonesn !");
	# The waypoint right before zoning to OOT
	# Signals the Boat Watcher in OOT (69150) with a value of 1.
	# This indicates that Siren's Bane must spawn in OOT.
	if($wp == 14)
	{
		quest::crosszonesignalnpcbynpctypeid(69150,1);
	}
	elsif($wp == 17)
	{
		# Last waypoint. We need to depop the EFP Siren's Bane
		# Siren's Bane in EFP will be repoped at the end of the boat cycle.é
		quest::depop(10196);
	}
}
