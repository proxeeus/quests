# Maiden's Voyage script for Firiona Vie.

sub EVENT_SPAWN
{
	quest::debugshout("Me voila a Firiona!");
}

sub EVENT_WAYPOINT_ARRIVE
{
	quest::debugshout("Je suis au waypoint $wp dans $zonesn !");
	# The waypoint right before zoning to Timorous
	# Signals the Boat Watcher in TD (96353) with a value of 1.
	# This indicates that Maiden's Voyage must spawn in TD.
	if($wp == 11)
	{
		quest::crosszonesignalnpcbynpctypeid(96353,1);
	}
	elsif($wp == 14)
	{
		# Last waypoint. We need to depop the Maiden's Voyage
		# Maiden's Voyage in Firiona will be repoped at the end of the boat cycle.
		quest::depop(84250);
	}
}
