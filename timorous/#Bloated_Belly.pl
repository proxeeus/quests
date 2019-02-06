# Bloated Belly's script for Timorous Deep

sub EVENT_WAYPOINT_ARRIVE
{
	if($wp == 11)
	{
		quest::crosszonesignalnpcbynpctypeid(93301, 1); 	# Spawn the Belly's in OT
		#old x: 2724.443359 	y: 3750.000000 	z: -182.000000
		#3557 3891 -183 311
		# player Z -176
	}
	elsif($wp == 13)	# signal OT's watcher to start the Belly's grid
	{
		quest::crosszonesignalnpcbynpctypeid(93301, 2); 
		quest::pause(3);
		quest::depop(96317);
	}
}

sub EVENT_SIGNAL
{
	if($signal == 1) # Time to start our TD Grid !
	{
		quest::debugshout("Alright, let's navigate through TD!");
		quest::start(38);
	}
}