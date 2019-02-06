# Skiff to Timorous Deep
my $skiffStatus = "";

sub EVENT_WAYPOINT_ARRIVE
{
	#quest::debugshout("Je suis au waypoint $wp dans $zonesn !");
	if( $npc->GetGrid() == 240 )
	{
		if($wp == 6)	
		{
			quest::depop(68320);
		}
	}
	elsif( $npc->GetGrid() == 244 )
	{
		if($wp == 4)	
		{
			quest::debugshout("Aaan' we back !");
			$skiffStatus = "returned";
			quest::pause(0);

		}
		elsif($wp == 8)
		{
			quest::debugshout("Laterz!");
			quest::depop();
		}
	}
}

sub EVENT_SIGNAL
{
	if($signal == 1) # Signal from Timorous Deep that it's time to get going
	{
		if($skiffStatus eq "returned")
		{
			quest::shout("Weee be resumin!");
			quest::pause(3);
			$npc->ResumeWandering();
			quest::pause(3);
			$npc->ResumeWandering();
		}
		else
		{
			$npc->SetGrid(240);
			quest::pause(3);
			$npc->UpdateWaypoint(0);
			quest::pause(3);
			quest::debugshout("Arr we be goin' !");
			quest::start(240);	
		}
	}
	elsif($signal == 2) # Let's go back to the docks!
	{

		quest::debugshout("Arr we be goin' back to the docks !");
		quest::start(244);

	}
}


