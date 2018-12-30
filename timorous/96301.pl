# Maiden's Voyage script for Timorous Deep.
my $skiffA = "";
my $skiffB = "";

my $butcherSkiffA = "";
my $butcherSkiffB = "";
my $butcherSkiffC = "";
my $butcherSkiffD = "";

sub EVENT_WAYPOINT_DEPART
{
	#quest::shout2("Je pars du waypoint $wp dans $zonesn !");
}
sub EVENT_WAYPOINT_ARRIVE
{
	quest::shout2("Je suis au waypoint $wp dans $zonesn !");
	# (Maybe 3)
	# This is the waypoint where the Maiden's Voyage first stops at. It should stop, send a signal to the island shuttles and wait for them come & board the ship.
	if($wp == 2)
	{
		#quest::stop();
		#quest::crosszonesignalnpcbynpctypeid(96353,1);
		#signal the shuttles to start their routes
		quest::shout2("Allez les shuttles on se bouge le fion!");
		quest::signalwith(96320, 1);
		quest::signalwith(96354, 1);
	}
	# Real stop??
	elsif($wp == 3)
	{
		$npc->PauseWandering(0);
		quest::shout2("je suis au wp3 et je me stop le temps que les shuttles arrivent");	
	}
	elsif($wp == 14)
	{
		#maybe signal BB shuttles to start moving their asses?
		quest::signalwith(96353, 2);
	}
	elsif($wp == 15)
	{
		$npc->PauseWandering(0);
		quest::shout2("je suis au wp15 et je me stop le temps que les shuttles arrivent de BBM.");	
		# Here, signal the 4 BB Shuttles to proceed for boarding.
		# The signal will set them on their respective grids.
		quest::signalwith(96355, 1);
		quest::signalwith(96356, 1);
		quest::signalwith(96357, 1);
		quest::signalwith(96358, 1);
	}
	elsif($wp == 22)
	{
		quest::crosszonesignalnpcbynpctypeid(84401 , 1);	# Signal FV's Boat Watcher to spawn Maiden's in FV
	}
	elsif($wp == 24)
	{
		quest::depop(96301);
	}
}

sub EVENT_SIGNAL
{
	if($signal == 1) # Signal from Skiff A that we've boarded
	{
		$skiffA = "boarded";
		quest::shout("Bien recu SkiffA!");
		if($skiffA eq "boarded" && $skiffB eq "boarded")
		{
			quest::shout2("Les 2 Shuttles ont bien board, on peut reprendre dans 10 secondes!");
			quest::settimer("island_depart", 10) ;
			$skiffA = "";
			$skiffB = "";
		}
	}
	elsif($signal == 2) # Signal from Skiff B that we've boarded
	{
		$skiffB = "boarded";
		quest::shout("Bien recu SkiffB!");
		if($skiffA eq "boarded" && $skiffB eq "boarded")
		{
			quest::shout2("Les 2 Shuttles ont bien board, on peut reprendre dans 10 secondes!");
			quest::settimer("island_depart", 10);
			$skiffA = "";
			$skiffB = "";
		}
	}
	elsif($signal == 3) # Butcher Skiff A left
	{
		$butcherSkiffA = "left";
		if($butcherSkiffA  eq "left" && $butcherSkiffB eq "left" && $butcherSkiffC eq "left" && $butcherSkiffD eq "left")
		{
			quest::shout2("Les 4 Shuttles ont bien left, on se tire vers FV !");
			$npc->ResumeWandering();
			quest::pause(3);
			$npc->ResumeWandering();
			
			$butcherSkiffA = "";
			$butcherSkiffB = "";
			$butcherSkiffC = "";
			$butcherSkiffD = "";
		}
	}
	elsif($signal == 4) # Butcher Skiff B left
	{
		$butcherSkiffB = "left";
		if($butcherSkiffA  eq "left" && $butcherSkiffB eq "left" && $butcherSkiffC eq "left" && $butcherSkiffD eq "left")
		{
			quest::shout2("Les 4 Shuttles ont bien left, on se tire vers FV !");
			$npc->ResumeWandering();
			quest::pause(3);
			$npc->ResumeWandering();
			
			$butcherSkiffA = "";
			$butcherSkiffB = "";
			$butcherSkiffC = "";
			$butcherSkiffD = "";
		}
	}
	elsif($signal == 5) # Butcher Skiff C left
	{
		$butcherSkiffC = "left";
		if($butcherSkiffA  eq "left" && $butcherSkiffB eq "left" && $butcherSkiffC eq "left" && $butcherSkiffD eq "left")
		{
			quest::shout2("Les 4 Shuttles ont bien left, on se tire vers FV !");
			$npc->ResumeWandering();
			quest::pause(3);
			$npc->ResumeWandering();
			
			$butcherSkiffA = "";
			$butcherSkiffB = "";
			$butcherSkiffC = "";
			$butcherSkiffD = "";
		}
	}
	elsif($signal == 6) # Butcher Skiff D left
	{
		$butcherSkiffD = "left";
		if($butcherSkiffA  eq "left" && $butcherSkiffB eq "left" && $butcherSkiffC eq "left" && $butcherSkiffD eq "left")
		{
			quest::shout2("Les 4 Shuttles ont bien left, on se tire vers FV !");
			$npc->ResumeWandering();
			quest::pause(3);
			$npc->ResumeWandering();
			
			$butcherSkiffA = "";
			$butcherSkiffB = "";
			$butcherSkiffC = "";
			$butcherSkiffD = "";
		}
	}
}

sub EVENT_TIMER
{
	if($timer eq "island_depart")
	{
		quest::stoptimer("island_depart");
		# Resume grid navigation, Island Shuttles can go home.
		quest::shout2("On se barre de l'ile, on reprend la route");
		quest::resume();
		quest::signalwith(96320, 2);
		quest::signalwith(96354, 2);
	}
}