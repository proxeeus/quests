# Siren's Bane for Ocean of Tears
# 

sub EVENT_WAYPOINT_ARRIVE
{
	if( $npc->GetGrid() == 63 ) # This is the FP - OOT - BB route
	{
		quest::debugshout("Je suis au waypoint $wp dans $zonesn ! FP - OOT - BB");
		# The WP before zoning to Butcherblock.
		# Here we signal the BB Boat Watcher to spawn the Siren's Bane in BB
		if($wp == 35) #was 38	
		{
			quest::crosszonesignalnpcbynpctypeid(68315, 1);
		}
		elsif($wp == 39)
		{
			# Last WP. We need to despawn the current boat.
			quest::depop(69153);
		}
	}
	elsif( $npc->GetGrid() == 62 ) # This is the BB - OOT - FP route
	{
		quest::debugshout("Je suis au waypoint $wp dans $zonesn ! BB - OOT - FP");
		# The WP before zoning to Freeport.
		# Here we signal the EFP Boat Watcher to spawn the Siren's Bane in EFP.
		if($wp == 22) #was 22	
		{
			quest::crosszonesignalnpcbynpctypeid(10155, 1); 
		}
		elsif($wp == 23) #was 24
		{
			# Last WP. We need to despawn the current boat.
			quest::depop(69153);
		}
	}
}