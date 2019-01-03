# Skiff to Timorous Deep
my $skiffStatus = "";

sub EVENT_WAYPOINT_ARRIVE
{
	#quest::shout2("Je suis au waypoint $wp dans $zonesn !");
	if( $npc->GetGrid() == 239 )
	{
		if($wp == 6)	
		{
			quest::depop(68319);
		}
	}
	elsif($npc->GetGrid() == 243 )
	{
		if($wp == 3)
		{
			quest::shout2("Aaan' we back !");
			$skiffStatus = "returned";
			quest::pause(0);

		}
		elsif($wp == 6)
		{
			quest::shout2("Laterz!");
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
			$npc->SetGrid(239);
			quest::pause(3);
			$npc->UpdateWaypoint(0);
			quest::pause(3);
			quest::shout2("Arr we be goin' !");
			quest::start(239);
		}
	}
	elsif($signal == 2) # Let's go back to the docks!
	{
		quest::shout2("Arr we be goin' back to the docks !");
		quest::start(243);
	}
}


