# Skiff to Timorous Deep

sub EVENT_WAYPOINT_ARRIVE
{
	#quest::shout2("Je suis au waypoint $wp dans $zonesn !");
	if( $npc->GetGrid() == 241 )
	{
		if($wp == 5)	
		{
			quest::depop(68321);
		}
	}
	if( $npc->GetGrid() == 245 )
	{
		if($wp == 6)
		{
			$npc->PauseWandering(0);
			quest::shout2("Aaan' we back !");
		}
	}
}

sub EVENT_SIGNAL
{
	if($signal == 1) # Signal from Timorous Deep that it's time to get going
	{
		quest::shout2("Arr we be goin' !");
		quest::start(241);
	}
	elsif($signal == 2) # Let's go back to the docks!
	{
		quest::shout2("Arr we be goin' back to the docks !");
		quest::start(245);
	}
}


