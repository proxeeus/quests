my $counter;

sub EVENT_SPAWN {  
	$x = $npc->GetX();
	$y = $npc->GetY();
	$z = $npc->GetZ();
	quest::set_proximity($x - 30, $x + 30, $y - 30, $y +30, -999999, 999999, 1);
	quest::enable_proximity_say();
}

sub EVENT_PROXIMITY_SAY  {
	if($text=~/Oh Brell, thank you for protecting me and seeing me through my trials. Forgive me for the things I think and say and do that displease you. Please reveal to me your will and bless me with the patience and obedience to do that which you desire. Amen./i) {
		$counter += 1;
		if ($counter == 1) {
		  quest::signalwith(115230,33,0);
		}
		elsif ($counter == 2) {
		  quest::signalwith(115230,66,0);
		}
		elsif ($counter == 3) {
		  quest::signalwith(115230,99,0);
		  $counter = 0;
		}
	}
}

