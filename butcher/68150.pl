# Skiff to Timorous Deep
my $skiffStatus = "";

sub EVENT_WAYPOINT_ARRIVE
{
	#quest::debugshout("Je suis au waypoint $wp dans $zonesn !");
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
			quest::debugshout("Aaan' we back !");
			$skiffStatus = "returned";
			quest::pause(0);
			
		}
		elsif($wp == 6)
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
			quest::debugshout("Weee be resumin!");
			quest::pause(3);
			$npc->ResumeWandering();
			quest::pause(3);
			$npc->ResumeWandering();
		}
		else
		{
			$npc->SetGrid(238);
			quest::pause(3);
			$npc->UpdateWaypoint(0);
			quest::pause(3);
			quest::debugshout("Arr we be goin' !");
			quest::start(238);
		}
	}
	elsif($signal == 2) # Let's go back to the docks!
	{
		quest::debugshout("Arr we be goin' back to the docks !");
		quest::start(242);

	}
}


