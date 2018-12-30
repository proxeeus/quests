# Skiff to Timorous Deep

sub EVENT_WAYPOINT_ARRIVE
{
	#quest::shout2("Je suis au waypoint $wp dans $zonesn !");
	if( $npc->GetGrid() == 238 )
	{
		if($wp == 5)	
		{
			quest::depop(68150);
		}
	}
	elsif($npc->GetGrid() == 242 )
	{
		if($wp == 3)
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
		quest::start(238);
	}
	elsif($signal == 2) # Let's go back to the docks!
	{
		quest::shout2("Arr we be goin' back to the docks !");
		quest::start(242);
	}
}


