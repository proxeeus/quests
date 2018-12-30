# BB Boat Watcher
# Will spawn the Siren's Bane in BB, going to OOT.
my $skiffA = "";
my $skiffB = "";
my $skiffC = "";
my $skiffD = "";

sub EVENT_SPAWN
{
    $x = $npc->GetX();
    $y = $npc->GetY();
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
	quest::shout("WATCHER TO OOT SPAWN");
} 

sub EVENT_SIGNAL
{
	if($signal == 1) 
	{
		#quest::spawn2(68228, 224, 0, 3680, 2010, -25, 254); # Z était à -26
		quest::spawn2(68228, 224, 0, 3600.02, 2253.84, -25, 249); #somewhat fixed, grid in db used to be 3680 2010 -25
		quest::shout("PUTAIN j'AI RECU UN SIGNAL MDR");
	}
	elsif($signal == 2)
	{
		quest::shout2("Yep on spawn les 4 skiffs en mode attente!");
		#update headings
		quest::spawn2(68150, 0, 0, 3572, -5, -12.72, 0);
		quest::spawn2(68319, 0, 0, 3540, -5, -12.72, 0);
		quest::spawn2(68320, 0, 0, 3506, -5, -12.72, 0);
		quest::spawn2(68321, 0, 0, 3476, -5, -12.72, 0);
	}
	elsif($signal == 3)
	{
		$skiffA = "ready";
		if($skiffA eq "ready" && $skiffB eq "ready" && $skiffC eq "ready" && $skiffD eq "ready" )
		{
			quest::shout2("Tous les shuttles ont bien depop dans TD, on peut faire avancer ceux de bbm!");
			quest::signalwith(68150, 2);
			quest::signalwith(68319, 2);
			quest::signalwith(68320, 2);
			quest::signalwith(68321, 2);
			$skiffA = "";
			$skiffB = "";
			$skiffC = "";
			$skiffD = "";
		}
	}
	elsif($signal == 4)
	{
		$skiffB = "ready";
		if($skiffA eq "ready" && $skiffB eq "ready" && $skiffC eq "ready" && $skiffD eq "ready" )
		{
			quest::shout2("Tous les shuttles ont bien depop dans TD, on peut faire avancer ceux de bbm!");
			quest::signalwith(68150, 2);
			quest::signalwith(68319, 2);
			quest::signalwith(68320, 2);
			quest::signalwith(68321, 2);
			$skiffA = "";
			$skiffB = "";
			$skiffC = "";
			$skiffD = "";
		}
	}
	elsif($signal == 5)
	{
		$skiffC = "ready";
		if($skiffA eq "ready" && $skiffB eq "ready" && $skiffC eq "ready" && $skiffD eq "ready" )
		{
			quest::shout2("Tous les shuttles ont bien depop dans TD, on peut faire avancer ceux de bbm!");
			quest::signalwith(68150, 2);
			quest::signalwith(68319, 2);
			quest::signalwith(68320, 2);
			quest::signalwith(68321, 2);
			$skiffA = "";
			$skiffB = "";
			$skiffC = "";
			$skiffD = "";
		}
	}
	elsif($signal == 6)
	{
		$skiffD = "ready";
		if($skiffA eq "ready" && $skiffB eq "ready" && $skiffC eq "ready" && $skiffD eq "ready" )
		{
			quest::shout2("Tous les shuttles ont bien depop dans TD, on peut faire avancer ceux de bbm!");
			quest::signalwith(68150, 2);
			quest::signalwith(68319, 2);
			quest::signalwith(68320, 2);
			quest::signalwith(68321, 2);
			$skiffA = "";
			$skiffB = "";
			$skiffC = "";
			$skiffD = "";
		}
	}
}
